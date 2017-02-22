The azureDeploy.json template creates a virtual network with 5 subnets: 
+ dc = Domain Controllers
+ jump = Jump Box(s)
+ web = Web Servers
+ api = Web API Servers
+ db = Database Servers

There are 6 string output parameters which may be passed to other templates:

+ vnetName
+ jumpSubnetName
+ dcSubnetName
+ webSubnetName
+ apiSubnetName
+ dbSubnetName

To run this template from locally, update vnetDeploy.parameters.json and run vnetDeploy.ps1. 

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)