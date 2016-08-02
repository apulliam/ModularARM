#$deploymentName="core"
$resourceGroupName="apulliam-core"
$resourceGroupLocation = "East US"

New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation
New-AzureRmResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName  -TemplateUri https://raw.githubusercontent.com/apulliam/ModularARM/master/Templates/coreDeploy.json -TemplateParameterUri https://raw.githubusercontent.com/apulliam/ModularARM/master/Templates/coreDeploy.parameters.json -Force -Verbose


