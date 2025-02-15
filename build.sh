#!/usr/bin/env bash

set -e

USER="manoj23"
REPO="mysql"
IMAGE="mysql"
ALPINE_VERSION="3.21.3"
MARIADB_VERSION="11.4.4-r1"
DOCKERFILE_HASH=$(git rev-parse --short HEAD)
BUILDER="alpine-${ALPINE_VERSION}"

docker_build_tag_and_push()
{
	TAG="${IMAGE}:${BUILDER}"

	docker build "https://github.com:/${USER}/dockerfile-${REPO}.git" \
		--build-arg "ALPINE_VERSION=${ALPINE_VERSION}" \
		--build-arg "MARIADB_VERSION=${MARIADB_VERSION}" \
		--build-arg "DOCKERFILE_HASH=${DOCKERFILE_HASH}" \
		-t "$TAG"

	if [ -z "$CR_PAT" ]; then
		echo "Please export CR_PAT, Bye!"
		return
	fi

	echo "$CR_PAT" | docker login ghcr.io -u "${USER}" --password-stdin

	docker tag "${TAG}" "ghcr.io/${USER}/${TAG}"
	docker push "ghcr.io/${USER}/${TAG}"
}

docker_build_tag_and_push "mysql"
