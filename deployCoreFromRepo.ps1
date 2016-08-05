$resourceGroupName="apulliam-core"
$resourceGroupLocation = "East US"
$deploymentStorageAccountName = "apulliamarmdeploy"
$templateFile = "coreDeploy.json"
$templateParametersFile = "coreDeploy.parameters.json"

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -DeploymentStorageAccountName $deploymentStorageAccountName -TemplateFile $templateFile -TemplateParametersFile $templateParametersFile
