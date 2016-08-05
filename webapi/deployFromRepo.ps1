$resourceGroupName="apulliam-frontEnd"
$resourceGroupLocation = "East US"
$deploymentStorageAccountName = "apulliamarmdeploy"

..\Deploy-AzureResourceGroup.ps1 -ResourceGroupLocation $resourceGroupLocation -ResourceGroupName $resourceGroupName -DeploymentStorageAccountName $deploymentStorageAccountName -Verbose 
