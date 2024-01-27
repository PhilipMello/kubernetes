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
microsoft=''
echo "
# --------------------------------------------------------------
# Script     : AKS Cluster State Check
# Description: AKS Cluster State Check
# Version    : $version
# Date       : $current_date
# Author     : $author
# License    : $license
# Github     : $github
# Microsoft  : $microsoft
# --------------------------------------------------------------
# How to use: Execute file ./state-check to verify if Cluste is SPN or MSI
# and your Cluter Name.
# Exemples: 
# --------------------------------------------------------------
"

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
