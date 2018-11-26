#!/usr/bin/env bash

which curl || {
    apt-get update
    apt-get install -y curl
}

which jq || {
    apt-get update
    apt-get install -y jq
}
