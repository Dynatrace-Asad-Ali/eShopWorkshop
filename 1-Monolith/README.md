### Deploying the Monolith application
Using the ARM template to deploy eShopOnWeb Monolithic .NET application with Dynatrace Extension applied
- this template will request a password for the eshopadmin user and the MSSQL DB admin
  - the DB Admin user will require 8 alpha chars, 1+ number, 1+ special chars.
- this ARM template will request your Dynatrace tenant URL, API token, & PaaS token
- in Bash CLI:
    > cd eShopOnWeb
    >
    > az group deployment create --name "eshopvm" --resource-group "eshopworkshop" --template-file "./src/VM/azuredeploy.json"

This takes ~15 mins to complete

-  SSH to VM using eshopadmin@[vm-ip-address]
  > tail /var/log/cloud-init-output.log 
- last line should be
  > "Cloud-init v. 19.3-41-gc4735dd3-0ubuntu1~18.04.1 finished..."

### Reviewing eShopOnWeb App
- confirm eShopOnWeb is running
  > docker ps 
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
