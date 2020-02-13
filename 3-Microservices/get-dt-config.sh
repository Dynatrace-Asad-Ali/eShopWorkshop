#!/bin/bash

YLW='\033[1;33m'
NC='\033[0m'

echo -e "${YLW}Please enter your Dynatrace credentials as requested below: ${NC}"
ENVIRONMENT_ID=""
read -p "Environment ID (ex. https://<ENVIRONMENT_ID>.sprint.dynatracelabs.com): " ENVIRONMENT_ID
API_TOKEN=""
read -p "API token: " API_TOKEN
PAAS_TOKEN=""
read -p "PaaS token: " PAAS_TOKEN
echo ""
echo -e "${YLW}Please confirm these are correct: ${NC}"
echo "Environment ID: " $ENVIRONMENT_ID
echo "API token: " $API_TOKEN
echo "PaaS token: " $PAAS_TOKEN

read -p "Is this correct? (y/n): " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
        export DT_ENVIRONMENT_ID=$ENVIRONMENT_ID
        export DT_API_TOKEN=$API_TOKEN
        export DT_PAAS_TOKEN=$PAAS_TOKEN

        sed -i -r 's~DT_ENVIRONMENT_ID=(.*)~DT_ENVIRONMENT_ID\='"$DT_ENVIRONMENT_ID"'~' ./configs.txt
        sed -i -r 's~DT_API_TOKEN=(.*)~DT_API_TOKEN\='"$DT_API_TOKEN"'~' ./configs.txt
        sed -i -r 's~DT_PAAS_TOKEN=(.*)~DT_PAAS_TOKEN\='"$DT_PAAS_TOKEN"'~' ./configs.txt

fi

echo ""

