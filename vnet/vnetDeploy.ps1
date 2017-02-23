$resourceGroupName="test"
$resourceGroupLocation = "East US"
$templateFile = "azureDeploy.json"
$templateParametersFile = "azureDeploy.parameters.json"
New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation -Force -Verbose
New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
                                   -TemplateFile $TemplateFile `
                                   -TemplateParameterFile $TemplateParametersFile `
                                   -Force -Verbose