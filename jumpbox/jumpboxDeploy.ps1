$resourceGroupName="jumpbox-test"
$resourceGroupLocation = "East US"
$templateFile = "azureDeploy.json"
$templateParametersFile = "jumpboxDeploy.parameters.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
                                   -TemplateFile $TemplateFile `
                                   -TemplateParameterFile $TemplateParametersFile `
                                   -Force -Verbose