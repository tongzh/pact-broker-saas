#!/bin/bash

TENANT_NAME=${1:? you should input the team name.}
echo "Start to remove container and volume data, tenant name is "${TENANT_NAME}
docker ps -f "status=exited" | grep ${TENANT_NAME}_pact | awk '{print $1}' | xargs --no-run-if-empty docker rm
docker volume rm ${TENANT_NAME}_data_volume
echo 'Successful!'