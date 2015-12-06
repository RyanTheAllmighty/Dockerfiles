# nginx
This is a build for [nginx](http://nginx.org/).

# Versions & Tags
- `1.9.7`, `1.9`, `1`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/nginx).

# Description
This image of nginx is built from source using debian:jessie as a base.

It compiles with a bunch of modules activated.

This images uses a nginx user and a nginx group for the nginx process.

# Build Arguments
VERSION: The version of nginx to build. If not provided the build will fail.

# Included Configs
These configs are included in the image and are located in the container in the /etc/nginx/conf/conf.d directory.

## phpfpm.conf & hhvm.conf
To connect nginx to a php interpreter you can simply include the /etc/nginx/conf/conf.d/phpfpm.conf into your sites configuration file to setup php forwarding.

Alternatively you can include the /hhvm.conf file for HHVM.

Note that these two files require that PHP-FPM/HHVM be listening on port 9000 and accessible from a hostname of hhvm or phpfpm.

## block.conf
This config file will block some common attack vectors from being served any further.

## drop.conf
This config file will not log any access to robots.txt and favicon.ico including 404 not found errors.

## staticfiles.conf
This config file will add in caching to common file types.

# Directories
## /etc/nginx/
This directory contains all the nginx configuration files.

## /etc/nginx/sites.d/
This directory is where nginx reads all it's site configuration files from.

## /etc/nginx/conf.d/
This directory is where nginx reads all it's additional configuration files from.

## /mnt/logs/nginx/
This directory is where all of the nginx logs are stored. Please note that this image expects to host only one site and that it's logs are stored at 'site-access.log' and 'site-error.log'. Any deviation from this may or may not work correctly.

## /mnt/site/
This directory is where I store my applications code generally. It is chowned to the nginx user and group on container startup if it exists.