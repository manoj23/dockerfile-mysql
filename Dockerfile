ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as builder
LABEL maintainer="Georges Savoundararadj <savoundg@gmail.com>"
LABEL org.opencontainers.image.source=https://github.com/manoj23/mysql
LABEL alpine-version=${ALPINE_VERSION}
LABEL dockerfile-hash=${DOCKERFILE_HASH:-}
ARG UID=${UID:-1000}
ARG GID=${GID:-1000}
ARG MARIADB_VERSION
RUN apk update && apk add --no-cache mariadb="${MARIADB_VERSION}"
VOLUME [ "/var/lib/mysql" ]
CMD [ "/usr/bin/mariadbd", \
    "--basedir=/usr", \
    "--datadir=/var/lib/mysql", \
    "--plugin-dir=/usr/lib/mariadb/plugin", \
    "--user=root", \
    "--socket=/run/mysqld.sock" ]
