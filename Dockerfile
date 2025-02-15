ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as builder
LABEL maintainer="Georges Savoundararadj <savoundg@gmail.com>"
LABEL org.opencontainers.image.source=https://github.com/manoj23/mysql
LABEL alpine-version=${ALPINE_VERSION}
LABEL dockerfile-hash=${DOCKERFILE_HASH:-}
ARG UID=${UID:-1000}
ARG GID=${GID:-1000}
RUN apk update && apk add mysql mysql-client
VOLUME [ "/var/lib/mysql" ]
CMD [ "mysqld_safe" ]
