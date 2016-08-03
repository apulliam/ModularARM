This script creates a virtual network with 5 subnets: 
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


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fapulliam%2FModularARM%2Fmaster%2Fvnet%2Fvnet.json" target="_blank">
     <img src="http://azuredeploy.net/deploybutton.png"/>
</a>