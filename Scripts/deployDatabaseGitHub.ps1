$deploymentName="database"
$resourceGroupName="apulliam-database"
$resourceGroupLocation = "East US"

New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation
New-AzureRmResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName  -TemplateUri https://raw.githubusercontent.com/apulliam/ModularARM/master/Templates/databaseDeploy.json -TemplateParameterUri https://raw.githubusercontent.com/apulliam/ModularARM/master/Templates/databaseDeploy.parameters.json -Force -Verbose

