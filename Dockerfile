FROM alpine:3.8 as builder
LABEL maintainer="Georges Savoundararadj <savoundg@gmail.com>"
RUN apk update && apk add mysql
VOLUME [ "/var/lib/mysql" ]
CMD [ "mysqld_safe" ]
