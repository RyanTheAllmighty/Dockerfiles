# Node
[![Docker Stars](https://img.shields.io/docker/stars/ryantheallmighty/node.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/node/) [![Docker Pulls](https://img.shields.io/docker/pulls/ryantheallmighty/node.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/node/) [![Image Size](https://img.shields.io/imagelayers/image-size/ryantheallmighty/node/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fnode) [![Image Layers](https://img.shields.io/imagelayers/layers/ryantheallmighty/node/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Fnode)

This is a build for [NodeJS](https://nodejs.org/en/).

# Versions & Tags
- `4.2.3`
- `4.2.4`
- `4.2.5`
- `4.2.6`, `4.2`, `4`, `lts`
- `5.1.1`, `5.1`
- `5.2.0`, `5.2`
- `5.3.0`, `5.3`
- `5.4.0`
- `5.4.1`, `5.4`
- `5.5.0`, `5.5`, `5`, `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/node).

# Build Arguments
VERSION: The version of node to build. If not provided the build will fail.

# Usage
To use this image simply run it like the following:

```
docker run -it ryantheallmighty/node node --version
```

You also have access to NPM so can start a program:

```
docker run -d -v /path/to/my/app/on/my/host:/app -w /app  ryantheallmighty/node npm start
```