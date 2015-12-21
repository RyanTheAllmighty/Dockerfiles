# Created and maintained by RyanTheAllmighty
# https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/hhvm

FROM debian:jessie
MAINTAINER Ryan Dowling <ryan@ryandowling.me>

# The version of HHVM we want to build and use
ARG VERSION

# The packages we want to install from the package manager and keep
ENV PACKAGES_FOR_INSTALL 'openssl git ca-certificates curl'

# The packages we want to install from the package manager to use to build and remove after we're done
ENV PACKAGES_FOR_BUILD ''

# Get the packages installed, removed, cleaned up as well as build and install HHVM
RUN set -x && \

    apt-get update && \
    apt-get install -y ${PACKAGES_FOR_INSTALL} ${PACKAGES_FOR_BUILD} && \

    apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 && \
    echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list && \
    apt-get update && \
    apt-get -y install hhvm && \

    apt-get remove -y ${PACKAGES_FOR_BUILD} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc /usr/share/man

COPY server.ini /etc/hhvm/server.ini
COPY entrypoint.sh /entrypoint.sh

RUN chown www-data:www-data /etc/hhvm/server.ini

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["hhvm", "--config /etc/hhvm/server.ini", "--user www-data", "--mode server"]