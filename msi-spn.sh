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
# Script     : Service Principal Name (SPN) RESET
# Description: Update or create a new service principal for your AKS cluster
# Version    : $version
# Date       : $current_date
# Author     : $author
# License    : $license
# Github     : $github
# Microsoft  : $microsoft
# --------------------------------------------------------------
# How to use: Execute file ./msi-spn to verify if cluster is MSI or SPN
# and your Cluter Name.
# Exemples:
# --------------------------------------------------------------
"

GREEN="\033[97;102m"
RED="\033[97;41m"
ENDCOLOR="\e[0m"

VAR1=$(sed -n 's/\"\(aadClientId\)\"\:[ ]\+\"\([[:alnum:]]\+\)\"[,$]\?/\2/p' etc/kubernetes/azure.json)

if [[ "$VAR1" == "msi" ]]; then
   echo -e "
+---------------------------------------------+
|${GREEN}Cluster is: Azure MSI (Managed Service Identity)${ENDCOLOR}|
+---------------------------------------------+"
else
   echo -e "
+----------------------------------------+
|${RED}Cluster is: Service Principal Name (SPN)${ENDCOLOR}|
+----------------------------------------+"
fi
