# Created and maintained by RyanTheAllmighty
# https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/rethinkdb

FROM debian:jessie
MAINTAINER Ryan Dowling <ryan@ryandowling.me>

# The version of RethinkDB we want to build and use
ARG VERSION

# The packages we want to install from the package manager and keep
ENV PACKAGES_FOR_INSTALL ''

# The packages we want to install from the package manager to use to build and remove after we're done
ENV PACKAGES_FOR_BUILD 'wget'

# This ensures that a version argument has to be passed into the build
RUN if [ -z "$VERSION" ]; then echo "VERSION must be set!"; exit 1; fi

# Get the packages installed, removed, cleaned up as well as build and install RethinkDB
RUN set -x && \

    apt-get update && \
    apt-get install -y ${PACKAGES_FOR_INSTALL} ${PACKAGES_FOR_BUILD} && \

    echo "deb http://download.rethinkdb.com/apt jessie main" | tee /etc/apt/sources.list.d/rethinkdb.list && \
    wget -qO- http://download.rethinkdb.com/apt/pubkey.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y rethinkdb=${VERSION}* && \
    rm -f /etc/rethinkdb/default.conf.sample && \

    apt-get remove -y ${PACKAGES_FOR_BUILD} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc /usr/share/man

COPY entrypoint.sh /entrypoint.sh

EXPOSE 8080 28015 29015

VOLUME ["/mnt/data/rethinkdb"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["rethinkdb", "--bind", "all"]