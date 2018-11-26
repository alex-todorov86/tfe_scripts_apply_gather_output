#!/usr/bin/env bash


# The organization name is passed as a first argument to the script
# The workspace name is passaed as a second argument to the script


# The following block of code is going to retrieve your TFE Workspace ID
WSPACE_ID="$(curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  https://app.terraform.io/api/v2/organizations/"$1"/workspaces/"$2" 2>/dev/null | jq '.data | .id' | tr -d \")"

# The following is added for debugging purposes. Will be removed in the final version
echo -e "Your workspace ID is: \n $WSPACE_ID \n"

# The following block of code is going to retrieve the current run ID of your TFE Workspace
CURRENT_RUN_ID="$(curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  https://app.terraform.io/api/v2/workspaces/"$WSPACE_ID"/runs 2>/dev/null | jq '.data | .[0] | .id' | tr -d \")"


# The following is added for debugging purposes. Will be removed in the final version

echo -e "Your Current Run ID is: \n $CURRENT_RUN_ID \n"

# The following block of code is going to retrieve the configuration ID of the current run on your TFE Workspace 

CONF_ID="$(curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  https://app.terraform.io/api/v2/runs/"$CURRENT_RUN_ID"/configuration-version 2>/dev/null | jq '.data | .id' | tr -d \")"


# The following is added for debugging purposes. Will be removed in the final version
echo -e "Your Configuration ID is: \n $CONF_ID \n"
