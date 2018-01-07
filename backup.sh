#!/bin/bash

TENANT_NAME=${1:? you should input the team name.}
echo "Start to backup volume, tenant name is "${TENANT_NAME}
TENANT_DB_CONTAINER=$(docker ps | grep ${TENANT_NAME}_pact_db | awk '{print $1}')
echo "Tenant db container id is "${TENANT_DB_CONTAINER}
docker run --rm --volumes-from ${TENANT_DB_CONTAINER} -v $(pwd):/backup ubuntu tar cvf /backup/${TENANT_NAME}-data.tar /var/lib/postgresql/data
echo "Successful! Please check "${TENANT_NAME}"-data.tar in current folder."