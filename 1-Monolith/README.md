### Deploying the Monolith application
This monolith application uses .net core and provides eShop functionality.\
For deployment is uses Microsoft Azure ARM template. The arm template not only creates a VM instance in Azure but also deploys Dynatrace OneAgent on the VM instance.

To install the application, go to https://portal.azure.com and login with your credentials. Once logged in, open a cloud shell in Azure.

![Image of Azure Cloud Shell-1](../images/AzureCloudShell1.png)

![Image of Azure Cloud Shell-2](../images/AzureCloudShell2.png)

Clone this repository

```git clone https://github.com/Dynatrace-Asad-Ali/eShopWorkshop.git```

```cd eShopWorkshop/1-Monolith/```


Run the following command in Cloud Shell to create a resource group that will be used by the ARM template. Please keep the name of the group as shown in the command below:\
```az group create --name eshopworkshop --location eastus```

Log into your Dynatrace tenant and create **API Token** and **PaaS Token** and note down the **Environment Id**:\
1. API Token: Settings -> Integration -> Dynatrace API

![API Token](../images/ApiToken.png)

2. Paas Token: Deploy Dynatrace -> Set up Paas Integration -> Create New Token

![Paas Token 1](../images/PaasToken1.png)

![Paas Token 2](../images/PaasToken2.png)

3. Environment Id:

![Environment Id](../images/EnvironmentID.png)


Then run the following command to execute the ARM template. This ARM template is going to request a password for MSSQL DB admin (which will the same for ssh password), tenant id (Environment Id), API Token and Paas Token.

```cd eShopOnWeb```\
```az group deployment create --name "eshopvm" --resource-group "eshopworkshop" --template-file "./src/VM/azuredeploy.json"```

This takes ~15 mins to complete

After the VM instance is created, ssh into the VM instance from the **cloud shell** and ensure that the ARM template has completed successfully.

```ssh eshopadmin@[vm-ip-address]```
```tail /var/log/cloud-init-output.log ```

Last line of the cloud-init-output.log should look like:


"Cloud-init v. 19.3-41-gc4735dd3-0ubuntu1~18.04.1 finished..."


### Reviewing eShopOnWeb App
Confirm eShopOnWeb is running

```docker ps ```

-  open browser and navigate to: 
    > https://[vm-ip-address]:5106

### Reviewing eShopOnWeb App in Dynatrace
Navigate around Dynatrace to review app

### Add front-end to eShopOnWeb App (deployed by default)
add nginx front end
  > cd /home/eshopadmin/eShopOnWeb/src/VM/
  >
  >  ./start-frontend.sh

review eShop at http://[vm-ip-address]

### Review eShopOnWeb App in Dynatrace to see RUM
- Navigate the application and complete some transactions including logging in and checkout
- Credentials for the demo app: demouser@microsoft.com/ 
- In Dynatrace go to Applications -> See the data collected for the frontend actions 
- Go to User Sessions -> Find out your session and see the replay
