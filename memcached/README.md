# Memcached
This is a build for [Memcached](http://memcached.org/).

# Versions & Tags
- `1.4.25`, `1.4`, `1`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/memcached).

# Description
This image of Memcached is built from source using debian:jessie as a base.

# Build Arguments
VERSION: The version of Memcached to build. If not provided the build will fail.

# Directories
## /mnt/logs/memcached/
This directory is where all of the Memcached logs are stored.

# Ports
This image exposes port 11211 for communication with Memcached.

# Usage
To use this image simply run it like the following:

```
docker run -d ryantheallmighty/memcached
```

This will start Memcached up with it's default paramaters which are:

```
memcached -u memcached -m 1024 -c 1024 -p 11211 -n 72 -o slab_reassign,slab_automove
```

You can provide your own options as below:

```
docker run -d ryantheallmighty/memcached memcached -u memcached -m 2048 -c 512
```