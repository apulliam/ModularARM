$resourceGroupName="apulliam-core"
$resourceGroupLocation = "East US"
$storageAccountName = "apulliamarmdeploy"
$storageContainerName = $resourceGroupName + "-stageartifacts"
<<<<<<< HEAD
 
.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -UploadArtifacts -StorageContainerName $storageContainerName -StorageAccountName $storageAccountName -TemplateFile ..\Templates\coreDeploy.json -TemplateParametersFile ..\Templates\coreDeploy.parameters.json -ArtifactStagingDirectory ".."  ..\DSC -Verbose 
=======

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -UploadArtifacts -StorageContainerName $storageContainerName -StorageAccountName $storageAccountName -TemplateFile ..\Templates\coreDeploy.json -TemplateParametersFile ..\Templates\coreDeploy.parameters.json -ArtifactStagingDirectory ".." -DSCSourceFolder ..\DSC -Verbose 
>>>>>>> 45e8afe92ca2d6fcbd2dfbab983be4465ef6d3b0
