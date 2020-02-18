#!/bin/bash

YLW='\033[1;33m'
NC='\033[0m'

echo -e "${YLW}Please enter password (This will be used for VMInstance).${NC} Password (Must be 6 char long with 1 Uppercase, 1 Lowercase, 1 number, 1 special character. ${NC}"
password=""
while true; do
    read -s -p "Password: " password
    echo
    read -s -p "Password (again): " password2
    echo
    [ "$password" = "$password2" ] && break
    echo "Please try again"
done

echo $password

