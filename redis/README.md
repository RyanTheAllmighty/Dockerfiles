# Redis
[![Docker Stars](https://img.shields.io/docker/stars/ryantheallmighty/redis.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/redis/) [![Docker Pulls](https://img.shields.io/docker/pulls/ryantheallmighty/redis.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/redis/) [![Image Size](https://img.shields.io/imagelayers/image-size/ryantheallmighty/redis/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fredis) [![Image Layers](https://img.shields.io/imagelayers/layers/ryantheallmighty/redis/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fredis)

This is a build for [Redis](http://redis.io/).

# Versions & Tags
- `3.0.5`
- `3.0.6`, `3.0`, `3`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/redis).

# Build Arguments
VERSION: The version of Redis to build. If not provided the build will fail.

# Ports
This image exposes port 6379 for communication with Redis.

# Usage
To use this image simply run it like the following:

```
docker run -d ryantheallmighty/redis
```