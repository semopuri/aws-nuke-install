#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

accNum=$(aws sts get-caller-identity |jq '.Account')

wget https://github.com/rebuy-de/aws-nuke/releases/download/v2.14.0/aws-nuke-v2.14.0-linux-amd64
sudo mv aws-nuke-v2.14.0-linux-amd64 /usr/bin/aws-nuke
sudo chmod u+x /usr/bin/aws-nuke

sed -i "s/<accNum>/"${accNum}"/" config.yml 