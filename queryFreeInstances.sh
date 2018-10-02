#!/bin/bash
user=admin
pw=
towerNode=yourIPorFQDN

curl -sk -u $user:$pw -H "Accept: application/json" https://$towerNode/api/v2/config/ | jq '.license_info.free_instances'
