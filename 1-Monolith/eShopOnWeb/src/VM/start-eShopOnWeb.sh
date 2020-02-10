#!/bin/bash
##################################################
# Script to start eShopOnWeb .NET monolithic app #
##################################################
cd /home/eshopadmin/eShopOnWeb
sed -i 's/localhost/localdb/g' /home/eshopadmin/eShopOnWeb/src/Web/appsettings.json
docker-compose build
docker-compose up -d