#!/bin/bash

SERVER=$1
SERVICE=$2
IP=$3
DATA=$(cat <<EOF
{
  "instance": {
    "hostName": "$IP",
    "app": "$SERVICE",
    "ipAddr": "$IP",
    "vipAddress": "",
    "secureVipAddress": "",
    "status": "UP",
    "port": "80",
    "securePort": "443",
    "homePageUrl": "",
    "statusPageUrl": "",
    "healthCheckUrl": "",
    "dataCenterInfo": {
      "name": "MyOwn"
    }
  }
}
EOF
)

curl -d "$DATA" http://$SERVER/eureka/apps/$SERVICE -H 'Content-Type: application/json'
