#!/bin/bash

CONSUMER_KEY=$1

result=$(curl -s --data "consumer_key=${CONSUMER_KEY}&redirect_uri=value2" https://getpocket.com/v3/oauth/request)
code=${result##*=}
echo "Code = ${code}"

open "https://getpocket.com/auth/authorize?request_token=${code}&redirect_uri=http://google.com"
sleep 5s     #This is a hack - ideally we should listen to redirect_uri

curl -H "X-accept: application/json" --data "consumer_key=${CONSUMER_KEY}&code=${code}" https://getpocket.com/v3/oauth/authorize
