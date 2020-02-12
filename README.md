# eShop Workshop

## Summary
This workshop is built with the intention of demonstrating the use of Dynatrace during a migration of a .NET monolith application into a .NET microservice application.  
The exercises in this workshop are making use of the existing Microsoft demo application named eShop packaged in a [monolith](1-Monolith) and containerized microservice architecture [3-Microservices](3-Microservices).  In addition the workshop is run within Azure.  

## Pre-Requisites
- Azure account with ability to create and manage virtual machines (VMs) as well as a 3-node Azure Kubernetes Cluster (AKS)
- Ability to run Azure Resource Manager (ARM) templates from within the Azure CLI
- Dynatrace account. You can start a trial [here] (https://www.dynatrace.com/trial/)

## Setup - Environment validation and navigation
### Azure
Log into Azure Portal 
- https://portal.azure.com
- open Azure Bash CLI [show icon]
  > run command: /> git clone https://github.com/safia-habib/eShopWorkshop.git
### Dynatrace
- Log into Dynatrace tenant. Get the tokens for authentication and authorization -> Copy the values in a notepad
  > [Copy tenant ID] : https://TenantUUID.live.dynatrace.co -> Copy the value of TenantUUID
  >
  > [Copy API token] : Settings-> Integration -> Dynatrace API -> Generate a new Token, Copy the token value
  >
  > [Copy PaaS token] : Settings -> Integration -> Platform as a Service -> Generate a new Token, Copy the token value

- Configure Dynatrace Tenant to instrument containers: Settings -> Processes and containers -> Container monitoring -> Turn on the following sliders
  - containerd
  - cri-o
  - docker

