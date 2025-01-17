#!/bin/sh

set -eux

IS_CONTAINER=${IS_CONTAINER:-false}
CONTAINER_RUNTIME="${CONTAINER_RUNTIME:-podman}"

if [ "${IS_CONTAINER}" != "false" ]; then
  export XDG_CACHE_HOME=/tmp/.cache
  make fmt
else
  "${CONTAINER_RUNTIME}" run --rm \
    --env IS_CONTAINER=TRUE \
    --volume "${PWD}:/go/src/github.com/metal3-io/cluster-api-provider-baremetal:ro,z" \
    --entrypoint sh \
    --workdir /go/src/github.com/metal3-io/cluster-api-provider-baremetal \
    registry.hub.docker.com/library/golang:1.12 \
    /go/src/github.com/metal3-io/cluster-api-provider-baremetal/hack/gofmt.sh
fi;
