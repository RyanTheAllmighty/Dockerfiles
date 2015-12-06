# HHVM
This is a build for [HHVM](http://hhvm.com/).

# Versions & Tags
- `3.10.1`, `3.10`, `3`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/hhvm).

# Description
This image of HHVM is built from source using debian:jessie as a base.

# Included Configs
## server.ini
This is stored in /etc/hhvm/ and provides the config for HHVM

# Environment Variables
## USE_REDIS_FOR_SESSIONS
When this environment variable is provided and is set to true it will enable the use of Redis for sessions. By default it expects there to be an instance of Redis running with a host of 'redis' on
port '6379'.

# Directories
## /mnt/logs/hhvm/
This directory is where all of the HHVM logs are stored.

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