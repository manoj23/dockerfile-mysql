ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as builder
LABEL maintainer="Georges Savoundararadj <savoundg@gmail.com>"
ARG UID=${UID:-1000}
ARG GID=${GID:-1000}
RUN apk update && apk add mysql mysql-client
RUN echo "mysql:x:${GID}:mysql" > /etc/group && echo "mysql:x:${UID}:${GID}:mysql:/var/lib/mysql:/sbin/nologin" > /etc/passwd
VOLUME [ "/var/lib/mysql" ]
CMD [ "mysqld_safe" ]
