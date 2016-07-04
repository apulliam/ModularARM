$resourceGroupName="apulliam-core"
$resourceGroupLocation = "East US"
$storageAccountName = "apulliamarmdeploy"
$storageContainerName = $resourceGroupName + "-stageartifacts"

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -UploadArtifacts -StorageContainerName $storageContainerName -StorageAccountName $storageAccountName -TemplateFile ..\Templates\coreDeploy.json -TemplateParametersFile ..\Templates\coreDeploy.parameters.json -ArtifactStagingDirectory "..\" -DSCSourceFolder ..\DSC -Verbose 
