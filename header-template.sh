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
github='https://github.com/PhilipMello/kubernetes/'
github2='https://github.com/AtomyCloud/kubernetes/'
# Microsoft Official Documentation
microsoft=''
echo "
# --------------------------------------------------------------
# Script     : Microsoft Azure AKS Script Automation
# Description: Create, Delete, Check, Fix. Azure AKS Cluster
# Version    : $version
# Date       : $current_date
# Author     : $author
# License    : $license
# Github     : $github
# Github     : $github2
# Microsoft  : $microsoft
# --------------------------------------------------------------
# How to use: Execute ./script-name
# Exemples:
# Manual: ./script-name -h OR ./script-name --h OR ./script-name --help
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