dockerfile-mysql
================

This is a simple alpine container that runs a mysql instance.

## Example of docker build

```
docker build -t mysql --build-arg UID=$(id -u) --build-arg GID=$(id -g) https://github.com:/manoj23/dockerfile-mysql.git
```

## Example of docker run


```
docker run --rm -ti -p 3306:3306 -v /path/to/db/:/var/lib/mysql/ mysql
```

Run the following command to initialize the data directory:
```
mkdir /path/to/db
docker run --rm -ti -v /path/to/db:/var/lib/mysql mysql mysql_install_db --user=mysql --ldata=/var/lib/mysql
```

## Example of docker-compose.yml

Put in a folder:
* docker-compose.yml as below

```
version: '3'
services:
  mysql:
    build: https://github.com:/manoj23/dockerfile-mysql.git
    ports:
      - "3306:3306"
    volumes:
      - /path/to/db/:/var/lib/mysql/
```
