#!/usr/bin/env bash

GREEN="\033[97;102m"
RED="\033[97;41m"
ENDCOLOR="\e[0m"

read -p "Type your Resource Group: " RG
read -p "Type your Cluster name: " AKS

echo -e "
+---------------------------------------------+
|${RED}Status: Updating Service Principal Name (SPN)${ENDCOLOR}|
+---------------------------------------------+
"

SP_ID=$(az aks show --resource-group $RG --name $AKS --query servicePrincipalProfile.clientId -o tsv)

SP_SECRET=$(az ad app credential reset --id "$SP_ID" --query password -o tsv)

SP_UPDATE=$(az aks update-credentials --resource-group $RG --name $AKS --reset-service-principal --service-principal "$SP_ID" --client-secret "${SP_SECRET}")

eval $SP_UPDATE

echo -e "
+--------------------------------------------+
|${GREEN}Status: Service Principal Name (SPN) Updated${ENDCOLOR}|
+--------------------------------------------+
"
