$resourceGroupName="apulliam-database"
$resourceGroupLocation = "East US"
$storageAccountResourceGroupName = "apulliam-armdeploy"
$storageAccountName = "apulliamarmdeploy"
$storageContainerName = $resourceGroupName + "-stageartifacts"

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation "East US" -ResourceGroupName "apulliam-database" -UploadArtifacts -StorageAccountResourceGroupName apulliam-armdeploy -StorageContainerName apulliam-database-stageartifacts -StorageAccountName apulliamarmdeploy -TemplateFile ..\Templates\databaseDeploy.json -TemplateParametersFile ..\Templates\databaseDeploy.parameters.json -ArtifactStagingDirectory "..\" -AzCopyPath ..\Tools\AzCopy.exe -DSCSourceFolder ..\DSC -Verbose 