# RethinkDB
[![Docker Stars](https://img.shields.io/docker/stars/ryantheallmighty/rethinkdb.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/rethinkdb/) [![Docker Pulls](https://img.shields.io/docker/pulls/ryantheallmighty/rethinkdb.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/rethinkdb/) [![Image Size](https://img.shields.io/imagelayers/image-size/ryantheallmighty/rethinkdb/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Frethinkdb) [![Image Layers](https://img.shields.io/imagelayers/layers/ryantheallmighty/rethinkdb/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Frethinkdb)

This is a build for [RethinkDB](http://rethinkdb.com/).

# Versions & Tags
- `2.2.1`
- `2.2.2`
- `2.2.3`
- `2.2.4`, `2.2`, `2`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/rethinkdb).

# Build Arguments
VERSION: The version of RethinkDB to build. If not provided the build will fail.

# Ports
This image exposes port 8080 for the web interface, 28015 for communication with RethinkDB and 29015 for cluster communication.

# Usage
To use this image simply run it like the following:

```
docker run -d ryantheallmighty/rethinkdb
```

This will start RethinkDB up with it's default parameters which are:

```
rethinkdb --bind all
```

You can provide your own options as below:

```
docker run -d ryantheallmighty/rethinkdb rethinkdb --config-file /etc/rethinkdb/instance.conf
```