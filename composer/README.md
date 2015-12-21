# Composer
[![Docker Stars](https://img.shields.io/docker/stars/ryantheallmighty/composer.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/composer/) [![Docker Pulls](https://img.shields.io/docker/pulls/ryantheallmighty/composer.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/composer/) [![Image Size](https://img.shields.io/imagelayers/image-size/ryantheallmighty/composer/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fcomposer) [![Image Layers](https://img.shields.io/imagelayers/layers/ryantheallmighty/composer/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fcomposer)

This is a build for [Composer](https://getcomposer.org/).

# Versions & Tags
- `php5.6`, `php5`
- `php7.0`, `php7`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/composer).

# Usage
To use this image simply run it like the following:

```
docker run -it ryantheallmighty/composer --version
```

Best used when mounting your PHP projects files and running Composer commands from there:

```
docker run -d -v /path/to/my/app/on/my/host:/app -w /app ryantheallmighty/composer install
```