#!/bin/bash -x

# Usage: ./.dhc-build.sh [docker-tag] [docker-push-options]

DOCKER_IMAGE_TAG="${1:-v2-return-ram}"

DOCKER_IMAGE_NAME1='reg-dhc.app.corpintra.net/caas/prometheus'
DOCKER_IMAGE_NAME2='reg.detss.corpintra.net/caas/prometheus'

echo make build \
  && docker build -t "$DOCKER_IMAGE_NAME1:$DOCKER_IMAGE_TAG" -t "$DOCKER_IMAGE_NAME2:$DOCKER_IMAGE_TAG" . \
  && docker ${2:-} push "$DOCKER_IMAGE_NAME1:$DOCKER_IMAGE_TAG" \
  && docker ${2:-} push "$DOCKER_IMAGE_NAME2:$DOCKER_IMAGE_TAG"
