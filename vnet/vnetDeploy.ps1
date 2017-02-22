$resourceGroupName="vnet-test"
$templateFile = "azureDeploy.json"
$templateParametersFile = "vnetDeploy.test.parameters.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
                                   -TemplateFile $TemplateFile `
                                   -TemplateParameterFile $TemplateParametersFile