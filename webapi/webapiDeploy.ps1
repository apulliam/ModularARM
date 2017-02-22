$resourceGroupName="webapi-test"
$resourceGroupLocation = "East US"
$templateFile = "azureDeploy.json"
$templateParametersFile = "webapiDeploy.parameters.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
                                   -TemplateFile $TemplateFile `
                                   -TemplateParameterFile $TemplateParametersFile `
                                   -Force -Verbose