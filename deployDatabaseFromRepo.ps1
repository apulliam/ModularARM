$resourceGroupName="apulliam-database"
$resourceGroupLocation = "East US"
$deploymentStorageAccountName = "apulliamarmdeploy"
$templateFile = "databaseDeploy.json"
$templateParametersFile = "databaseDeploy.parameters.json"

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -DeploymentStorageAccountName $deploymentStorageAccountName -TemplateFile $templateFile -TemplateParametersFile $templateParametersFile 
