# Composer
This is a build for [Composer](https://getcomposer.org/).

# Versions & Tags
- `latest`

# Github
The files for this build are available [here](https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/composer).

# Description
This image of Composer is built from source using ryantheallmighty/php:5.6 as a base.

# Usage
To use this image simply run it like the following:

```
docker run -it ryantheallmighty/composer --version
```

Best used when mounting your PHP projects files and running Composer commands from there:

```
docker run -d -v /path/to/my/app/on/my/host:/app -w /app  ryantheallmighty/composer install
```