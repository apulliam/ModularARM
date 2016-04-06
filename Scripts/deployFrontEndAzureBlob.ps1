$resourceGroupName="apulliam-frontend"
$resourceGroupLocation = "East US"
$storageAccountResourceGroupName = "apulliam-armdeploy"
$storageAccountName = "apulliamarmdeploy"
$storageContainerName = $resourceGroupName + "-stageartifacts"

.\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation "East US" -ResourceGroupName "apulliam-frontEnd" -UploadArtifacts -StorageAccountResourceGroupName apulliam-armdeploy -StorageContainerName apulliam-frontend-stageartifacts -StorageAccountName apulliamarmdeploy -TemplateFile ..\Templates\frontEndDeploy.json -TemplateParametersFile ..\Templates\frontEndDeploy.parameters.json -ArtifactStagingDirectory "..\" -AzCopyPath ..\Tools\AzCopy.exe -DSCSourceFolder ..\DSC
