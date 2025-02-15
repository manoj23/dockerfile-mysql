ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as builder
LABEL maintainer="Georges Savoundararadj <savoundg@gmail.com>"
ARG UID=${UID:-1000}
ARG GID=${GID:-1000}
RUN apk update && apk add mysql mysql-client
VOLUME [ "/var/lib/mysql" ]
CMD [ "mysqld_safe" ]
