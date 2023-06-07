#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")";

. $SCRIPT_DIR/.config;

if [[ -z $SHOPWARE_PATH ]]; then
  echo "Your SHOPWARE_PATH variable has not been set";
  exit;
elif [[ -z $LICENSE_HOST ]]; then
  echo "Your LICENSE_HOST variable has not been set";
  exit;
elif [[ -z $LICENSE_TOGGLES ]]; then
  echo "Your LICENSE_TOGGLES variable has not been set";
  exit;
fi

echo 'Please enter your Shopware-X token:';
read shopware_x;

license_key=$(curl --silent --request POST \
  --url https://api.shopware.com/internal/commerciallicensekeysforshopwaredevelopers \
  --header 'Content-Type: application/json' \
  --header "X-Shopware-Token: $shopware_x" \
  --data "{
    \"licenseHost\": \"$LICENSE_HOST\",
    \"licenseToggles\": $LICENSE_TOGGLES
}" | jq -r '.key');

if [[ "$license_key" == "null" ]]; then
  printf "\n";
  echo "Entered Shopware-X token was invalid. Could not set license information.";
else
  $SHOPWARE_PATH/bin/console system:config:set core.store.licenseHost $LICENSE_HOST;
  $SHOPWARE_PATH/bin/console system:config:set core.store.licenseKey $license_key;
fi
