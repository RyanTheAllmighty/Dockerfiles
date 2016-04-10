# nginx
[![Docker Stars](https://img.shields.io/docker/stars/ryantheallmighty/nginx.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/nginx/) [![Docker Pulls](https://img.shields.io/docker/pulls/ryantheallmighty/nginx.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/nginx/) [![Image Size](https://img.shields.io/imagelayers/image-size/ryantheallmighty/nginx/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fnginx) [![Image Layers](https://img.shields.io/imagelayers/layers/ryantheallmighty/nginx/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fnginx)

This is a build for [nginx](http://nginx.org/).

It compiles with a bunch of modules activated.

This images uses a nginx user and a nginx group for the nginx process.

# Versions & Tags
- `1.9.7`
- `1.9.9`
- `1.9.10`
- `1.9.11`
- `1.9.12`
- `1.9.13`
- `1.9.14`, `1.9`, `1`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/nginx).

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

## /mnt/site/
This directory is where I store my applications code generally. It is chowned to the nginx user and group on container startup if it exists.

# Ports
This image exposes port 80 and 443 for http and https connections.