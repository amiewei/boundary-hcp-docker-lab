#!/bin/bash

set -v

docker-compose down
docker-compose down --volumes

export ORG_ID_DEL=$(boundary scopes list -format=json | jq -r '.items[] | select(.name == "Docker Lab") | .id')

#delete workers that have no name (this won't delete hcp-managed-worker)
export WORKER_IDS_DEL=$(boundary workers list -format=json | jq -r '.items[] | select(.type == "pki" and (.name == null)) | .id')
echo $WORKER_IDS_DEL


boundary scopes delete -id=$ORG_ID_DEL

while IFS= read -r ID; do
    echo $ID
    boundary workers delete -id=$ID
done <<< "$WORKER_IDS_DEL"

kind delete cluster

rm -rf cluster.yaml
rm -rf init.txt
rm -rf ca.crt
rm -rf vault-cluster-role.yaml
rm -rf ./config/boundary/file/* 
rm -rf ./config/vault/file/* 
