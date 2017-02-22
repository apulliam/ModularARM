$resourceGroupName="webserver-test"
$resourceGroupLocation = "East US"

New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation -Verbose -Force
New-AzureRmStorageAccount -Name "webservertestdiag" -ResourceGroupName $resourceGroupName -Location $resourceGroupLocation -SkuName Standard_LRS
$subnet = New-AzureRmVirtualNetworkSubnetConfig -Name "test-web" -AddressPrefix "10.0.1.0/24"
New-AzureRmVirtualNetwork -Name "test-vnet" -ResourceGroupName $resourceGroupName -Location $resourceGroupLocation -AddressPrefix "10.0.0.0/16" -Subnet $subnet
