### Discover services within the monolith application
The monolith application is one application that hosts multiple services in it. As we engage in breaking this monolith applications into microservices, it is important to understand what services are hosted within the monolith application and what are the dependencies between these services. 

Dynatrace allows you to create custom services that not only allows you to see the service flow but also shows you the dependency map. Lets create custom services in Dynatrace to see this service flow.

1. Create custom services in Dynatrace

Log into the Dynatrace tenant. Go to Settings->Server-side service monitoring->Custom service detection

![CustomService-1](../images/CustomService-1.png)

Add the following custom service detection rules in Dynatrace

|Class Name                                                  | Method Name            |
|------------------------------------------------------------|------------------------|
|Microsoft.eShopWeb.ApplicationCore.Interfaces.IOrderService | CreateOrderAsync       |
|Microsoft.eShopWeb.ApplicationCore.Interfaces.IBasketService| GetBasketItemCountAsync|
|Microsoft.eShopWeb.Web.Services.ICatalogViewModelService.   | GetCatalogItems.       |

![CustomService-2](../images/CustomService-2.png)
![CustomService-3](../images/CustomService-3.png)

![CustomService-4](../images/CustomService-4.png)

![CustomService-5](../images/CustomService-5.png)

![CustomService-6](../images/CustomService-6.png)

![CustomService-7](../images/CustomService-7.png)

![CustomService-8](../images/CustomService-8.png)


2. Restart the docker container for **eshopwebmvc**

```docker ps```

![DockerPS](../images/DockerPs.png)

```docker restart <container id>```


3. Run transaction on the web application

4. Review data in Dynatrace

![ServiceFlow-1](../images/ServiceFlow.png)

