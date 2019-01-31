#!/usr/bin/env bash

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

docker stack rm message-broker
docker stack rm keycloak
docker stack rm learning-outcome

docker network inspect coalbase_backend &> /dev/null && docker network rm coalbase_backend
