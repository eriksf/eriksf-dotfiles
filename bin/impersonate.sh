#!/bin/bash

BASE_URL=$(awk -F, '{print $2}' ~/.agave/current | cut -d '"' -f 4)
CLIENT_SECRET=$(awk -F, '{print $4}' ~/.agave/current | cut -d '"' -f 4)
CLIENT_KEY=$(awk -F, '{print $5}' ~/.agave/current | cut -d '"' -f 4)

ADMIN_USER=$(awk -F, '{print $6}' ~/.agave/current | cut -d '"' -f 4)
TARGET_USER=$1

echo -n "Admin password: "
stty -echo; read "PASSWORD"; stty echo
echo ""

curl -u $CLIENT_KEY:$CLIENT_SECRET -X POST -d"grant_type=admin_password&username=${ADMIN_USER}&password=${PASSWORD}&token_username=${TARGET_USER}&scope=PRODUCTION" $BASE_URL/token
