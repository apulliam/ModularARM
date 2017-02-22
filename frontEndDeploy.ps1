$resourceGroupName="apulliam-frontend"
$resourceGroupLocation = "East US"
$templateFile = "frontEndDeploy.json"
$templateParametersFile = "frontEndDeploy.parameters.json"

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -TemplateFile $templateFile -TemplateParametersFile $templateParametersFile -UploadArtifacts
