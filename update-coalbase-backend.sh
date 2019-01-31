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

(cd "$INF_CURRENT"/coalbase-message-broker && pwd && git pull)
(cd "$INF_CURRENT"/coalbase-keycloak && pwd && git pull)
(cd "$BE_CURRENT"/coalbase-learning-outcome && pwd && git pull)
