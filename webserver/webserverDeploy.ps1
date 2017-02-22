$resourceGroupName="webserver-test"
$resourceGroupLocation = "East US"
$templateFile = "azureDeploy.json"
$templateParametersFile = "webserverDeploy.parameters.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
                                   -TemplateFile $TemplateFile `
                                   -TemplateParameterFile $TemplateParametersFile `
                                   -Force -Verbose