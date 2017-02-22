$resourceGroupName="vnet-test"
$resourceGroupLocation = "East US"

New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation -Verbose -Force