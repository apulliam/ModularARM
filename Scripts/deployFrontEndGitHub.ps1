$deploymentName="frontEnd"
$resourceGroupName="apulliam-frontEnd"
$resourceGroupLocation = "East US"

New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation
New-AzureRmResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName  -TemplateUri https://raw.githubusercontent.com/apulliam/ModularARM/master/Templates/frontEndDeploy.json -TemplateParameterUri https://raw.githubusercontent.com/apulliam/ModularARM/master/Templates/frontEndDeploy.parameters.json -Force -Verbose

