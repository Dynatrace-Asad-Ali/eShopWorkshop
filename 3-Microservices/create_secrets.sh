#!/bin/bash

YLW='\033[1;33m'
NC='\033[0m'

echo ""

DT_API_TOKEN=$(grep "DT_API_TOKEN=" configs.txt | sed 's~DT_API_TOKEN=[ \t]*~~')
DT_PAAS_TOKEN=$(grep "DT_PAAS_TOKEN=" configs.txt | sed 's~DT_PAAS_TOKEN=[ \t]*~~')

echo -e "${YLW}Runnig the following command...${NC}"
echo "kubectl -n dynatrace create secret generic oneagent --from-literal=\"apiToken=$DT_API_TOKEN\" --from-literal=\"paasToken=$DT_PAAS_TOKEN\""
kubectl -n dynatrace create secret generic oneagent --from-literal="apiToken=$DT_API_TOKEN" --from-literal="paasToken=$DT_PAAS_TOKEN"

