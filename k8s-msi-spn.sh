#!/usr/bin/env bash

VAR1=$(awk '/aadClientId/ {print $2}' etc/kubernetes/azure.json | sed 's/"//g' | sed 's/,//')
GREEN="\e[32m"
RED="\e[31m"
ENDCOLOR="\e[0m"

if [[ "$VAR1" == "msi" ]]; then
    echo -e "${GREEN}Cluster is: Azure MSI (Managed Service Identity)${ENDCOLOR}"
else
    echo -e "${RED}Cluster is: Service Principal Name (SPN)${ENDCOLOR}"
fi
