$resourceGroupName="apulliam-frontend"
$resourceGroupLocation = "East US"
$storageAccountName = "apulliamarmdeploy"
$storageContainerName = $resourceGroupName + "-stageartifacts"

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -UploadArtifacts -StorageContainerName $storageContainerName -StorageAccountName $storageAccountName -TemplateFile ..\Templates\frontendDeploy.json -TemplateParametersFile ..\Templates\frontEndDeploy.parameters.json -ArtifactStagingDirectory "..\" -DSCSourceFolder ..\DSC -Verbose 
