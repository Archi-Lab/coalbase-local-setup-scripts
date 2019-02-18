#!/usr/bin/env bash

docker network inspect coalbase_backend &> /dev/null || docker network create coalbase_backend --scope swarm --driver overlay

INF_CURRENT="$(pwd)"
BE_CURRENT="$(pwd)"
INF_DIR="$(pwd)/Infrastructure"
BE_DIR="$(pwd)/Backend"

if [ -d "$INF_DIR" ]; then
  INF_CURRENT="$INF_DIR"
fi

if [ -d "$BE_DIR" ]; then
  BE_CURRENT="$BE_DIR"
fi

docker stack deploy -c "$INF_CURRENT"/coalbase-message-broker/docker-compose.yml message-broker
docker stack deploy --with-registry-auth -c "$INF_CURRENT"/coalbase-keycloak/docker-compose.yml -c "$INF_CURRENT"/coalbase-keycloak/docker-compose-local.yml keycloak
docker stack deploy --with-registry-auth -c "$BE_CURRENT"/coalbase-learning-outcome/src/main/docker/docker-compose.yml -c "$BE_CURRENT"/coalbase-learning-outcome/src/main/docker/docker-compose-local.yml learning-outcome
