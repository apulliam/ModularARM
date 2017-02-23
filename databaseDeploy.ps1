$resourceGroupName="apulliam-database"
$resourceGroupLocation = "East US"
$templateFile = "databaseDeploy.json"
$templateParametersFile = "databaseDeploy.parameters.json"

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -TemplateFile $templateFile -TemplateParametersFile $templateParametersFile -UploadArtifacts
