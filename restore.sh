#!/bin/bash

TENANT_NAME=${1:? you should input the team name.}
echo "Start to restore volume, tenant name is "${TENANT_NAME}
TENANT_DB_CONTAINER=$(docker ps | grep ${TENANT_NAME}_pact_db | awk '{print $1}')
echo "Tenant db container id is "${TENANT_DB_CONTAINER}
docker run --rm --volumes-from ${TENANT_DB_CONTAINER} -v $(pwd):/backup ubuntu tar xvf /backup/${TENANT_NAME}-data.tar -C /
echo "Successful! Data restored from "${TENANT_NAME}"-data.tar to container ${TENANT_DB_CONTAINER}."
# Must restart db container to make restored data effective.
docker restart ${TENANT_DB_CONTAINER}
echo "Tenant db container restarted."