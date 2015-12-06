# Utility
This is a utility image I use for various things and stuff.

# Versions & Tags
- `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/rethinkdb).

# Description
This image of Utility is built from source using debian:jessie as a base.

# Usage
To use this image simply run it like the following:

```
docker run -it ryantheallmighty/utility
```

Which will by default give you a bash shell. You also have access to other tools such as php, composer, node, npm and basic Linux tools.

```
docker run -it ryantheallmighty/utility cat /etc/hostname
```