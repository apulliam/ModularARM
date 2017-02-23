The azureDeploy.json template in this directory deploys a jumpbox to an existing VNET.

To run this template from locally, update jumpboxDeploy.parameters.json and run jumpboxDeploy.ps1. 

The following parameters must refer to already created resources:
    vnetResourceGroup
    vnetName
    jumpboxSubnetName
    diagStorageAccountName
    
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)