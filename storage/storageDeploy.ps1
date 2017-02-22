$resourceGroupName="storage-test"
$templateFile = "azureDeploy.json"
$templateParametersFile = "storageDeploy.parameters.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
                                   -TemplateFile $TemplateFile `
                                   -TemplateParameterFile $TemplateParametersFile 
                                   
