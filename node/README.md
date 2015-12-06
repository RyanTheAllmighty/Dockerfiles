# node
This is a build for [NodeJS](https://nodejs.org/en/).

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/node).

# Description
This image of node is built from source using debian:jessie as a base.

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