#!/usr/bin/env bash

GREEN="\033[97;102m"
RED="\033[97;41m"
ENDCOLOR="\e[0m"

read -p "Type your Resource Group: " RG
read -p "Type your cluster name: " AKS

VAR1=$(az aks show --resource-group $RG --name $AKS  | grep "provisioningState" | awk '/provisioningState/ {printf $2}' | sed 's/"//g' | sed 's/,//g')

VAR2=$(az aks show --resource-group $RG --name $AKS  | grep "provisioningState" | awk '/provisioningState/ {printf $2}' | sed 's/"//g' | sed 's/,//g')

if [[ "$VAR1" == "Code: ResourceGroupNotFound" ]]; then
echo -e "
+------------------------------------------+
|${RED}Resource Group Not Found${ENDCOLOR}|
+------------------------------------------+
"

elif [[ "$VAR1" == "FailedFailed" ]]; then
echo -e "
+------------------------+
|${RED}Cluster is: Failed State${ENDCOLOR}|
+------------------------+
"

else
echo -e "
+---------------------------+
|${GREEN}Cluster is: Succeeded State${ENDCOLOR}|
+---------------------------+
"
fi
