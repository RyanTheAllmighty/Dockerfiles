# HHVM
[![Docker Stars](https://img.shields.io/docker/stars/ryantheallmighty/hhvm.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/hhvm/) [![Docker Pulls](https://img.shields.io/docker/pulls/ryantheallmighty/hhvm.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/hhvm/) [![Image Size](https://img.shields.io/imagelayers/image-size/ryantheallmighty/hhvm/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fhhvm) [![Image Layers](https://img.shields.io/imagelayers/layers/ryantheallmighty/hhvm/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fhhvm)

This is a build for [HHVM](http://hhvm.com/).

# Versions & Tags
- `3.6.6`, `3.6`
- `3.9.1`, `3.9`
- `3.11.0`, `3.11`, `3`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/hhvm).

# Included Configs
## server.ini
This is stored in /etc/hhvm/ and provides the config for HHVM

# Environment Variables
## USE_REDIS_FOR_SESSIONS
When this environment variable is provided and is set to true it will enable the use of Redis for sessions. By default it expects there to be an instance of Redis running with a host of 'redis' on
port '6379'.

# Ports
This image exposes port 9000 for communication with HHVM.

# Usage
To use this image simply run it like the following:

```
docker run -d ryantheallmighty/hhvm
```

This will start HHVM up with it's default parameters which are:

```
hhvm --config /etc/hhvm/server.ini --user www-data --mode server
```

You can provide your own options as below:

```
docker run -d ryantheallmighty/hhvm hhvm --config /etc/hhvm/server.ini --user www-data
```