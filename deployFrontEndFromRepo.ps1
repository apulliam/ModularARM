$resourceGroupName="apulliam-frontend"
$resourceGroupLocation = "East US"
$deploymentStorageAccountName = "apulliamarmdeploy"
$templateFile = "frontEndDeploy.json"
$templateParametersFile = "frontEndDeploy.parameters.json"

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -DeploymentStorageAccountName $deploymentStorageAccountName -TemplateFile $templateFile -TemplateParametersFile $templateParametersFile 
