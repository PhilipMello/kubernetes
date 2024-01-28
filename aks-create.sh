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
BLUE=""
YELLOW="\033[97;105m"
GREEN="\033[97;102m"
RED="\033[97;41m"
ENDCOLOR="\e[0m"

read -p "Type your Resource Group: " resourcegroup
read -p "Type your Cluster name: " clustername
read -p "Choose location: " location
reap -p "How many nodes? " nodecount
reap -p "Which Network Plugin (azure or kubenet): " networkplugin
reap -p "AKS pricing tier {free, premium, standard}: " tier

akscreate=$(az aks create --resource-group $resourcegroup --name $clustername --location $location --node-count $nodecount
--network-plugin $networkplugin --tier $tier)

echo -e "
+-----------------------+
|${BLUE}Creating AKS cluster...${ENDCOLOR}|
+-----------------------+
"

eval $akscreate

echo -e "
+--------------------------------------------+
|${GREEN}xxxxxxxxxxxxxxxxx${ENDCOLOR}|
+--------------------------------------------+
"
