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
# Script     : Azure AKS Creator
# Description: Create Azure AKS Cluster
# Version    : $version
# Date       : $current_date
# Author     : $author
# License    : $license
# Github     : $github
# Microsoft  : $microsoft
# --------------------------------------------------------------
# How to use: Execute ./aks-create
# Exemples:
# --------------------------------------------------------------
"
WHITE=""
BLUE="\033[97;104m"
YELLOW="\033[97;103m"
CYAN="\033[97;106m"
MAGENTA="\033[97;45m"
GREEN="\033[97;102m"
RED="\033[97;41m"
ENDCOLOR="\e[0m"

read -p "Type your Resource Group: " resourcegroup
read -p "Type your Cluster name: " clustername
read -p "Choose location: " location
read -p "How many nodes? " nodecount
read -p "Which Network Plugin (azure or kubenet): " networkplugin
read -p "AKS pricing tier {free, premium, standard}: " tier

akscreate=$(az aks create --resource-group $resourcegroup --name $clustername --location $location --node-count $nodecount
--network-plugin $networkplugin --tier $tier)

echo -e "
+-----------------------+
|${MAGENTA}Creating AKS cluster...${ENDCOLOR}|
+-----------------------+
"
echo -e "
+----------------------------------------------------------------+
|${BLUE}AKS cluster creation initiated. This might take a few minutes...${ENDCOLOR}|
+----------------------------------------------------------------+
"

eval $akscreate

echo -e "
+--------------------------------------------+
|${GREEN}xxxxxxxxxxxxxxxxx${ENDCOLOR}|
+--------------------------------------------+
"
