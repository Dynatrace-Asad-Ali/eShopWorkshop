#!/bin/bash
############################################################################
# This script will build and start the frontend Nginx Proxy for eShopOnWeb #                                           #
############################################################################
cd /home/eshopadmin/eShopOnWeb/src/Proxy/
docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up -d