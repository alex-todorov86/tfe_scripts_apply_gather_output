#!/usr/bin/env bash


# The organization name is passed as a first argument to the script
# The workspace name is passaed as a second argument to the script


WSPACE_ID="$(curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  https://app.terraform.io/api/v2/organizations/"$1"/workspaces/"$2" 2>/dev/null | jq '.data | .id' | tr -d \")"

# The following is added for debugging purposes. Will be removed in the final version
echo -e "Your workspace ID is: \n $WSPACE_ID \n"


CONF_ID="$(curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  https://app.terraform.io/api/v2/workspaces/"$WSPACE_ID"/runs 2>/dev/null | jq '.data | .[0] | .id' | tr -d \")"


# The following is added for debugging purposes. Will be removed in the final version

echo -e "Your Current Run ID is: \n $CONF_ID \n"
