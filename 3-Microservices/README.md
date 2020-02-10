## Step 3 -  Deploying Microservices based eshop
### creating an AKS deployment
> az group create --name eshopworkshop --location eastus

> az aks create --resource-group eshopworkshop --name eshopaks --node-count 3 --enable-addons monitoring,http_application_routing --generate-ssh-keys
### Deploy the OneAgent Operator in AKS
https://www.dynatrace.com/support/help/shortlink/kubernetes-deploy#install-oneagent-operator

> kubectl create namespace dynatrace\
> LATEST_RELEASE=$(curl -s https://api.github.com/repos/dynatrace/dynatrace-oneagent-operator/releases/latest | grep tag_name | cut -d '"' -f 4)
> kubectl create -f https://raw.githubusercontent.com/Dynatrace/dynatrace-oneagent-operator/$LATEST_RELEASE/deploy/kubernetes.yaml
> kubectl -n dynatrace logs -f deployment/dynatrace-oneagent-operator
>kubectl -n dynatrace create secret generic oneagent --from-literal="apiToken=[API_TOKEN](https://www.dynatrace.com/support/help/reference/dynatrace-concepts/what-is-an-access-token/)" --from-literal="paasToken=[PAAS_TOKEN](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/kubernetes/installation-and-operation/full-stack/deploy-oneagent-on-kubernetes/#expand-1380how-to-get-your-paas-token)"
### Deploy the eShopOnContainers App
- clone [eShopOnContainers](https://github.com/peterhack/eShopOnContainers) to Azure CLI dir

> cd ./eShopOnContainers/deploy/k8s/helm/
>
> kubectl create namespace eshop
>
> ./deploy-all.sh --aks-name eshopaks --aks-rg eshopworkshop --tag dev --dns aks --namespace eshop
>
> kubectl apply -f aks-httpaddon-cfg.yaml
>
> kubectl delete pod $(kubectl get pod -l app=addon-http-application-routing-nginx-ingress -n kube-system -o jsonpath="{.items[0].metadata.name}") -n kube-system

you can get the DNS name of your aks cluster with the following:
> kubectl get ing -n eshop

 You can view the MVC client at http://[dns]/webmvc
