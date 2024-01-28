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
read -p "Choose location: " location
reap -p "How many nodes? " nodecount
reap -p "Which Network Plugin (azure or kubenet): " networkplugin

echo -e "
+---------------------------------------------+
|${RED}xxxxxxxxxxxxxx${ENDCOLOR}|
+---------------------------------------------+
"

eval

echo -e "
+--------------------------------------------+
|${GREEN}xxxxxxxxxxxxxxxxx${ENDCOLOR}|
+--------------------------------------------+
"
