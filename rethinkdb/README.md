# RethinkDB
This is a build for [RethinkDB](http://rethinkdb.com/).

# Versions & Tags
- `2.2.1`, `2.2`, `2`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/rethinkdb).

# Description
This image of RethinkDB is built from source using debian:jessie as a base.

# Build Arguments
VERSION: The version of RethinkDB to build. If not provided the build will fail.

# Included Configs
## instance.conf
This is stored in /etc/rethinkdb/ and provides the config for RethinkDB

# Directories
## /mnt/logs/rethinkdb/
This directory is where all of the RethinkDB logs are stored.

# Ports
This image exposes port 8080 for the web interface, 28015 for communication with RethinkDB and 29015 for cluster communication.

# Usage
To use this image simply run it like the following:

```
docker run -d ryantheallmighty/rethinkdb
```

This will start RethinkDB up with it's default parameters which are:

```
rethinkdb --config-file /etc/rethinkdb/instance.conf
```

You can provide your own options as below:

```
docker run -d ryantheallmighty/rethinkdb rethinkdb --config-file /etc/rethinkdb/another-instance.conf
```