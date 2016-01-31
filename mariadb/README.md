# MariaDB
[![Docker Stars](https://img.shields.io/docker/stars/ryantheallmighty/mariadb.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/mariadb/) [![Docker Pulls](https://img.shields.io/docker/pulls/ryantheallmighty/mariadb.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/mariadb/) [![Image Size](https://img.shields.io/imagelayers/image-size/ryantheallmighty/mariadb/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fmariadb) [![Image Layers](https://img.shields.io/imagelayers/layers/ryantheallmighty/mariadb/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fmariadb)

This is a build for [MariaDB](https://mariadb.org/).

# Versions & Tags
- `10.1.9`
- `10.1.10`
- `10.1.11`, `10.1`, `10`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/mariadb).

# Build Arguments
VERSION: The version of MariaDB to build. If not provided the build will fail.

# Included Configs
## my.cnf
This is stored in /etc/mysql/ and provides the configs for MariaDB.

# Directories
## /mnt/data/mariadb/
This directory is where all of the databases are stored for MariaDB.

# Environment Variables
## MYSQL_ROOT_PASSWORD
If provided this sets the root users password on first startup.

## MYSQL_APP_USERNAME & MYSQL_APP_PASSWORD
If both are provided this will create a user with the given username and password on first startup.

## MYSQL_APP_DATABASE
If provided along with the 2 above environment variables this will create a database with this name and assign it to the above user on first startup.

# Ports
This image exposes port 3306 which is the port that MariaDB listens on for connections.

# Usage
To use this image simply run it like the following:

```
docker run -d ryantheallmighty/mariadb
```

If you wish to create a user and database just run the following:

```
docker run -d -e MYSQL_APP_USERNAME=user -e MYSQL_APP_USERNAME=password -e MYSQL_APP_DATABASE=my-database ryantheallmighty/mariadb
```