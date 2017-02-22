$resourceGroupName="apulliam-core"
$resourceGroupLocation = "East US"
$templateFile = "coreDeploy.json"
$templateParametersFile = "coreDeploy.parameters.json"

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -TemplateFile $templateFile -TemplateParametersFile $templateParametersFile -UploadArtifacts
