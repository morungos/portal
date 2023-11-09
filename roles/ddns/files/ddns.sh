#!/usr/bin/env bash

set -euf -o pipefail

## Get the current IP address
EXTERNAL_ADDRESS=`curl -f -s 'https://api.ipify.org'`

## Get the current record
CURRENT_ADDRESS=`curl -f -s -X GET \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
  "https://api.digitalocean.com/v2/domains/$DOMAIN/records/$RECORD" \
  | jq -r .domain_record.data`

echo "EXTERNAL_ADDRESS" $EXTERNAL_ADDRESS
echo "CURRENT_ADDRESS" $CURRENT_ADDRESS

if [ "${EXTERNAL_ADDRESS}" != "${CURRENT_ADDRESS}" ]; then
    curl -s -X PATCH https://api.digitalocean.com/v2/domains/$DOMAIN/records/$RECORD \
         -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
         -H 'Content-Type: application/json' \
         -H 'Accept: application/json' \
         -d "{\"data\": \"$EXTERNAL_ADDRESS\"}"
else
    echo "No need to change address"
fi;
