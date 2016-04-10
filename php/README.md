# PHP
[![Docker Stars](https://img.shields.io/docker/stars/ryantheallmighty/php.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/php/) [![Docker Pulls](https://img.shields.io/docker/pulls/ryantheallmighty/php.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/php/) [![Image Size](https://img.shields.io/imagelayers/image-size/ryantheallmighty/php/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fphp) [![Image Layers](https://img.shields.io/imagelayers/layers/ryantheallmighty/php/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fphp)

This is a build for [PHP](http://php.net/).

# Versions & Tags
- `5.6.16`
- `5.6.17`
- `5.6.18`
- `5.6.19`
- `5.6.20`, `5.6`, `5`
- `7.0.1`
- `7.0.2`
- `7.0.3`
- `7.0.4`
- `7.0.5`, `7.0`, `7`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/php).

# Build Arguments
VERSION: The version of PHP to build. If not provided the build will fail.

# Included Configs
## custom.ini
This is stored in /usr/local/etc/php/conf.d/ and provides overwrites for PHP.ini.

## php-fpm.conf
This is stored in /usr/local/etc/ and provides the config for PHP-FPM.

# Usage
To use this image simply run it like the following:

```
docker run -it ryantheallmighty/php php --version
```

You also have access to PHP-FPM so you can start a PHP FPM server on port 9000 with the following:

```
docker run -d ryantheallmighty/php php-fpm
```

# XDebug
Xdebug is compiled but not enabled by default. To enable it simply add in the following line to the `/usr/local/etc/php/conf.d/custom.ini` file:

```
zend_extension = /usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so
```