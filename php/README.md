# PHP
[![Docker Stars](https://img.shields.io/docker/stars/ryantheallmighty/php.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/php/) [![Docker Pulls](https://img.shields.io/docker/pulls/ryantheallmighty/php.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/php/) [![Image Size](https://img.shields.io/imagelayers/image-size/ryantheallmighty/php/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fphp) [![Image Layers](https://img.shields.io/imagelayers/layers/ryantheallmighty/php/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fphp)

This is a build for [PHP](http://php.net/).

# Versions & Tags
- `5.6.16`
- `5.6.17`
- `5.6.18`
- `5.6.19`, `5.6`, `5`
- `7.0.1`
- `7.0.2`
- `7.0.3`
- `7.0.4`, `7.0`, `7`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/php).

# Build Arguments
VERSION: The version of PHP to build. If not provided the build will fail.

# Included Configs
## custom.ini
This is stored in /usr/local/etc/php/conf.d/ and provides overwrites for PHP.ini.

## php-fpm.conf
This is stored in /usr/local/etc/ and provides the config for PHP-FPM.

# Directories
## /mnt/logs/php/
This directory is where all of the PHP-FPM logs are stored.

# Environment Variables
## USE_REDIS_FOR_SESSIONS
When this environment variable is provided and is set to true it will enable the use of Redis for sessions. By default it expects there to be an instance of Redis running with a host of 'redis' on
port '6379'.

# Usage
To use this image simply run it like the following:

```
docker run -it ryantheallmighty/php php --version
```

You also have access to PHP-FPM so you can startup up a PHP FPM server on port 9000 with the following:

```
docker run -d ryantheallmighty/php php-fpm
```

# XDebug
Xdebug is included and enabled by default in versions 5.6.17 and above as well as versions 7.0.2 and above.