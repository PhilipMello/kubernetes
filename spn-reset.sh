#!/usr/bin/env bash
# Author
author="Philip Mello <@Microsoft>"
# Version
version="1.0"
# License
license="MIT"
# Date
current_date=$(date +'%b %d, %Y')
# GitHub
github='https://github.com/PhilipMello/k8s/'
# Microsoft Official Documentation
microsoft='https://learn.microsoft.com/en-us/azure/aks/update-credentials#update-or-create-a-new-service-principal-for-your-aks-cluster'
echo "
# --------------------------------------------------------------
# Script     :
# Description:
# Version    : $version
# Date       : $current_date
# Author     : $author
# License    : $license
# Github     : $github
# Microsoft  : $microsoft
# --------------------------------------------------------------
# How to use:
# Exemples:
# --------------------------------------------------------------
"

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
