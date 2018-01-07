#!/bin/bash

TENANT_NAME=${1:? you should input the team name.}
echo "Start to stop container, tenant name is "${TENANT_NAME}
docker ps | grep ${TENANT_NAME}_pact | awk '{print $1}' | xargs --no-run-if-empty docker stop
echo 'Successful!'