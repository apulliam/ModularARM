#Requires -Version 3.0
#Requires -Module AzureRM.Resources
#Requires -Module Azure.Storage

Param(
    [string] [Parameter(Mandatory=$true)] $ResourceGroupLocation,
    [string] [Parameter(Mandatory=$true)] $ResourceGroupName,
    [string] [Parameter(Mandatory=$true)] $DeploymentStorageAccountName,
    [string] $TemplateFile = "azuredeploy.json",
    [string] $TemplateParametersFile = "azuredeploy.parameters.json",
    [string] $ArtifactStagingDirectory = "."
  
)



Import-Module Azure -ErrorAction SilentlyContinue

try {
    [Microsoft.Azure.Common.Authentication.AzureSession]::ClientFactory.AddUserAgent("VSAzureTools-$UI$($host.name)".replace(" ","_"), "2.9")
} catch { }

Set-StrictMode -Version 3

$OptionalParameters = New-Object -TypeName Hashtable
$TemplateFile = Resolve-Path $TemplateFile
$TemplateParametersFile = Resolve-Path $TemplateParametersFile



Set-Variable ArtifactsLocationName '_artifactsLocation' -Option ReadOnly -Force
Set-Variable ArtifactsLocationSasTokenName '_artifactsLocationSasToken' -Option ReadOnly -Force

$Upload = $false


# Parse the template file to determine if artifacts location paramter is present
$JsonContent = Get-Content $TemplateFile -Raw | ConvertFrom-Json
$JsonParameters = $JsonContent | Get-Member -Type NoteProperty | Where-Object {$_.Name -eq "parameters"}

if ($JsonParameters -eq $null) {
    $JsonParameters = $JsonContent
}
else {
    $JsonParameters = $JsonContent.parameters
}

$JsonParameters | Get-Member -Type NoteProperty | ForEach-Object {
  
    if ($_.Name -eq $ArtifactsLocationName) {
        $Upload = $true
    }
}


# Generate the value for artifacts location and SAS if it is not provided in the template file

if ($Upload -eq $true) {

    $ArtifactStagingDirectory1 = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($PSScriptRoot, $ArtifactStagingDirectory))
    $ArtifactStagingDirectory = Resolve-Path $ArtifactStagingDirectory

    $StorageAccountContext = (Get-AzureRmStorageAccount | Where-Object{$_.StorageAccountName -eq $DeploymentStorageAccountName}).Context

    $StorageContainerName = $ResourceGroupName.ToLowerInvariant() + '-stageartifacts'
    $ArtifactsLocation = $StorageAccountContext.BlobEndPoint + $StorageContainerName 
    $OptionalParameters[$ArtifactsLocationName] = $ArtifactsLocation

    # Create a SAS token for the storage container - this gives temporary read-only access to the container
    $ArtifactsLocationSasToken = New-AzureStorageContainerSASToken -Container $StorageContainerName -Context $StorageAccountContext -Permission r -ExpiryTime (Get-Date).AddHours(4)
    $ArtifactsLocationSasToken = ConvertTo-SecureString $ArtifactsLocationSasToken -AsPlainText -Force
    $OptionalParameters[$ArtifactsLocationSasTokenName] = $ArtifactsLocationSasToken

    # Copy files from the local storage staging location to the storage account container
    New-AzureStorageContainer -Name $StorageContainerName -Context $StorageAccountContext -Permission Container -ErrorAction SilentlyContinue *>&1

    # Convert relative paths to absolute paths if needed
    $ArtifactStagingDirectory = Resolve-Path $ArtifactStagingDirectory

    $ArtifactFilePaths = Get-ChildItem $ArtifactStagingDirectory -Recurse -File | ForEach-Object -Process {$_.FullName}
    foreach ($SourcePath in $ArtifactFilePaths) {
        $BlobName = $SourcePath.Substring($ArtifactStagingDirectory.length + 1)
        Set-AzureStorageBlobContent -File $SourcePath -Blob $BlobName -Container $StorageContainerName -Context $StorageAccountContext -Force
    }

    
    
    
}

# Create or update the resource group using the specified template file and template parameters file
New-AzureRmResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation -Verbose -Force -ErrorAction Stop 

New-AzureRmResourceGroupDeployment -Name ((Get-ChildItem $TemplateFile).BaseName + '-' + ((Get-Date).ToUniversalTime()).ToString('MMdd-HHmm')) `
                                   -ResourceGroupName $ResourceGroupName `
                                   -TemplateFile $TemplateFile `
                                   -TemplateParameterFile $TemplateParametersFile `
                                   @OptionalParameters `
                                   -Force -Verbose