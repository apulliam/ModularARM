$resourceGroupName="apulliam-core"
$resourceGroupLocation = "East US"
$storageAccountResourceGroupName = "apulliam-armdeploy"
$storageAccountName = "apulliamarmdeploy"
$storageContainerName = $resourceGroupName + "-stageartifacts"
 
.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -UploadArtifacts -StorageAccountResourceGroupName $storageAccountResourceGroupName -StorageContainerName $storageContainerName -StorageAccountName $storageAccountName -TemplateFile ..\Templates\coreDeploy.json -TemplateParametersFile ..\Templates\coreDeploy.parameters.json -ArtifactStagingDirectory "..\" -AzCopyPath ..\Tools\AzCopy.exe -DSCSourceFolder ..\DSC -Verbose 
