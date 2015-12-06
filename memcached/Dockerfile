# Created and maintained by RyanTheAllmighty
# https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/memcached

FROM debian:jessie
MAINTAINER Ryan Dowling <ryan@ryandowling.me>

# The version of Memcached we want to build and use
ARG VERSION

# The packages we want to install from the package manager and keep
ENV PACKAGES_FOR_INSTALL 'libevent-2.0-5'

# The packages we want to install from the package manager to use to build and remove after we're done
ENV PACKAGES_FOR_BUILD 'curl gcc libc6-dev libevent-dev make perl'

# This ensures that a version argument has to be passed into the build
RUN if [ -z "$VERSION" ]; then echo "VERSION must be set!"; exit 1; fi

# Get the packages installed, removed, cleaned up as well as build and install Memcached
RUN set -x && \

    groupadd -r memcached && \
    useradd -r -g memcached memcached && \

    apt-get update && \
    apt-get install -y ${PACKAGES_FOR_INSTALL} ${PACKAGES_FOR_BUILD} && \

    set -x && \
    mkdir -p /usr/src/memcached && \
    cd /usr/src/memcached && \
    curl -SL "http://memcached.org/files/memcached-${VERSION}.tar.gz" -o memcached.tar.gz && \
    tar -xzf memcached.tar.gz --strip-components=1 && \
    rm -f memcached.tar.gz && \
    ./configure && \
    make -j $(nproc) && \
    make install && \
    cd / && \
    rm -rf /usr/src/memcached && \

    apt-get remove -y ${PACKAGES_FOR_BUILD} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/lib/gcc /usr/share/doc /usr/share/man

COPY entrypoint.sh /entrypoint.sh

EXPOSE 11211

VOLUME ["/mnt/logs/memcached"]

USER memcached
ENTRYPOINT ["/entrypoint.sh"]
CMD ["memcached", "-u memcached", "-m 1024", "-c 1024", "-p 11211", "-n 72", "-o slab_reassign,slab_automove"]