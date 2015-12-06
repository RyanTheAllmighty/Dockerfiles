# php
This is a build for [PHP](http://php.net/).

# Versions & Tags
- `5.6.16`, `5.6`, `5`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/php).

# Description
This image of PHP is built from source using debian:jessie as a base.

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