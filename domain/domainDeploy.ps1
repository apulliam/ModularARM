$resourceGroupName="domain-test"
$resourceGroupLocation = "East US"
$templateFile = "azureDeploy.json"
$templateParametersFile = "domainDeploy.parameters.json"

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -TemplateFile $templateFile -TemplateParametersFile $templateParametersFile -UploadArtifacts
