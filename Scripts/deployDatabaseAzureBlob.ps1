$resourceGroupName="apulliam-database"
$resourceGroupLocation = "East US"
$storageAccountName = "apulliamarmdeploy"
$storageContainerName = $resourceGroupName + "-stageartifacts"

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -UploadArtifacts -StorageContainerName $storageContainerName -StorageAccountName $storageAccountName -TemplateFile ..\Templates\databaseDeploy.json -TemplateParametersFile ..\Templates\databaseDeploy.parameters.json -ArtifactStagingDirectory "..\" -DSCSourceFolder ..\DSC -Verbose 