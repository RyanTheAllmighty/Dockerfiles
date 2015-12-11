# Created and maintained by RyanTheAllmighty
# https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/redis

FROM debian:jessie
MAINTAINER Ryan Dowling <ryan@ryandowling.me>

# The version of Redis we want to build and use
ARG VERSION

# The packages we want to install from the package manager and keep
ENV PACKAGES_FOR_INSTALL ''

# The packages we want to install from the package manager to use to build and remove after we're done
ENV PACKAGES_FOR_BUILD 'ca-certificates curl make gcc'

# This ensures that a version argument has to be passed into the build
RUN if [ -z "$VERSION" ]; then echo "VERSION must be set!"; exit 1; fi

# Get the packages installed, removed, cleaned up as well as build and install Redis
RUN set -x && \

	groupadd -r redis && \
    useradd -r -g redis redis && \

    apt-get update && \
    apt-get install -y ${PACKAGES_FOR_INSTALL} ${PACKAGES_FOR_BUILD} && \

    curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture)" && \
	chmod +x /usr/local/bin/gosu && \

    mkdir -p /usr/src/redis && \
    curl -sSL "http://download.redis.io/releases/redis-${VERSION}.tar.gz" -o redis.tar.gz && \
    tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 && \
    rm redis.tar.gz && \
    make -j $(nproc) -C /usr/src/redis && \
    make -j $(nproc) -C /usr/src/redis install && \
    rm -r /usr/src/redis && \

    apt-get remove -y ${PACKAGES_FOR_BUILD} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/lib/gcc /usr/share/doc /usr/share/man

COPY entrypoint.sh /entrypoint.sh

RUN mkdir /data && chown redis:redis /data
VOLUME /data
WORKDIR /data

EXPOSE 6379

ENTRYPOINT ["/entrypoint.sh"]
CMD ["redis-server"]