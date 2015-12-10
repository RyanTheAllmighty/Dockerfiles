# Utility
[![Docker Stars](https://img.shields.io/docker/stars/ryantheallmighty/utility.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/utility/) [![Docker Pulls](https://img.shields.io/docker/pulls/ryantheallmighty/utility.svg?style=flat-square)](https://hub.docker.com/r/ryantheallmighty/utility/) [![Image Size](https://img.shields.io/imagelayers/image-size/ryantheallmighty/utility/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Futility) [![Image Layers](https://img.shields.io/imagelayers/layers/ryantheallmighty/utility/latest.svg?style=flat-square)](https://imagelayers.io/?images=ryantheallmighty%2Futility)

This is a utility image I use for various things and stuff.

# Versions & Tags
- `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/utility).

# Usage
To use this image simply run it like the following:

```
docker run -it ryantheallmighty/utility
```

Which will by default give you a bash shell. You also have access to other tools such as php, mysql, composer, node, npm and basic Linux tools.

```
docker run -it ryantheallmighty/utility cat /etc/hostname
```