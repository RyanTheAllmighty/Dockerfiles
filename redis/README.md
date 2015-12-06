# Redis
This is a build for [Redis](http://redis.io/).

# Versions & Tags
- `3.0.5`, `3.0`, `3`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/redis).

# Description
This image of Redis is built from source using debian:jessie as a base.

# Build Arguments
VERSION: The version of Redis to build. If not provided the build will fail.

# Included Configs
## redis.conf
This is stored in /etc/ and provides the config for Redis

# Directories
## /mnt/logs/redis/
This directory is where all of the Redis logs are stored.

# Ports
This image exposes port 6379 for communication with Redis.

# Usage
To use this image simply run it like the following:

```
docker run -d ryantheallmighty/redis
```