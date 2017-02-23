The azureDeploy.json template in this directory creates a new domain and deploys Primary and Backup Domain Controllers on an existing VNET. 

To run this template from locally, update domainDeploy.parameters.json and run domainDeploy.ps1. 
The following parameters must refer to already created resources:
    vnetResourceGroup
    vnetName
    domainSubnetName
    diagStorageAccountName

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)