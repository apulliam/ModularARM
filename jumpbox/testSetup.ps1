$resourceGroupName="jumpbox-test"
$resourceGroupLocation = "East US"

New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation -Verbose -Force
New-AzureRmStorageAccount -Name "jumpboxtestdiag" -ResourceGroupName $resourceGroupName -Location $resourceGroupLocation -SkuName Standard_LRS
$subnet = New-AzureRmVirtualNetworkSubnetConfig -Name "test-jump" -AddressPrefix "10.0.0.0/24"
New-AzureRmVirtualNetwork -Name "test-vnet" -ResourceGroupName $resourceGroupName -Location $resourceGroupLocation -AddressPrefix "10.0.0.0/16" -Subnet $subnet
