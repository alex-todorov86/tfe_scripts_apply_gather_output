#!/usr/bin/env bash

WSPACE_ID="$(curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  https://app.terraform.io/api/v2/organizations/"$1"/workspaces/"$2" | jq '.data | .id')"


# The following is added for debugging purposes. Will be removed in the final version
echo $WSPACE_ID
