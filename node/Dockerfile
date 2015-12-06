# Created and maintained by RyanTheAllmighty
# https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/node

FROM debian:jessie
MAINTAINER Ryan Dowling <ryan@ryandowling.me>

# The version of NodeJS we want to build and use
ARG VERSION

# The packages we want to install from the package manager and keep
ENV PACKAGES_FOR_INSTALL 'curl'

# The packages we want to install from the package manager to use to build and remove after we're done
ENV PACKAGES_FOR_BUILD ''

# This ensures that a version argument has to be passed into the build
RUN if [ -z "$VERSION" ]; then echo "VERSION must be set!"; exit 1; fi

# Get the packages installed, removed, cleaned up as well as build and install NodeJS
RUN set -x && \

    apt-get update && \
    apt-get install -y ${PACKAGES_FOR_INSTALL} ${PACKAGES_FOR_BUILD} && \

    mkdir -p /usr/src/nodejs && \
    cd /usr/src/nodejs && \
    curl -SL "https://nodejs.org/dist/v${VERSION}/node-v${VERSION}-linux-x64.tar.gz" -o node.tar.gz && \
    tar zvxf node.tar.gz -C /usr/local --strip-components=1 && \
    cd / && \
    rm -rf /usr/src/nodejs && \

    apt-get remove -y ${PACKAGES_FOR_BUILD} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/src /usr/lib/gcc /usr/share/doc /usr/share/man

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["node"]