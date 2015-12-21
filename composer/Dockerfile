# Created and maintained by RyanTheAllmighty
# https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/composer

FROM ryantheallmighty/php:7.0
MAINTAINER Ryan Dowling <ryan@ryandowling.me>

# Install composer
RUN set -x && \

    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENTRYPOINT ["composer", "--ansi"]