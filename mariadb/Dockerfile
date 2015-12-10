# Created and maintained by RyanTheAllmighty
# https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/mariadb

FROM debian:jessie
MAINTAINER Ryan Dowling <ryan@ryandowling.me>

# The version of MariaDB we want to build and use
ARG VERSION

# The packages we want to install from the package manager and keep
ENV PACKAGES_FOR_INSTALL ''

# The packages we want to install from the package manager to use to build and remove after we're done
ENV PACKAGES_FOR_BUILD 'debconf-utils software-properties-common'

# This ensures that a version argument has to be passed into the build
RUN if [ -z "$VERSION" ]; then echo "VERSION must be set!"; exit 1; fi

# Get the packages installed, removed, cleaned up as well as build and install MariaDB
RUN set -x && \

    groupadd -r mysql && \
    useradd -r -g mysql mysql && \

    apt-get update && \
    apt-get install -y ${PACKAGES_FOR_INSTALL} ${PACKAGES_FOR_BUILD} && \

    apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 199369E5404BD5FC7D2FE43BCBCB082A1BB943DB && \
    add-apt-repository "deb http://mirror.aarnet.edu.au/pub/MariaDB/mariadb-${VERSION}/repo/debian jessie main" && \
    echo 'Package: *' >> /etc/apt/preferences.d/mariadb && \
    echo 'Pin: release o=MariaDB' >> /etc/apt/preferences.d/mariadb && \
    echo 'Pin-Priority: 999' >> /etc/apt/preferences.d/mariadb && \

    apt-get update && \
    echo "mariadb-server-5.5 mysql-server/root_password_again password insecure" | debconf-set-selections && \
    echo "mariadb-server-5.5 mysql-server/root_password password insecure" | debconf-set-selections && \
    echo "mariadb-server-10.0 mysql-server/root_password_again password insecure" | debconf-set-selections && \
    echo "mariadb-server-10.0 mysql-server/root_password password insecure" | debconf-set-selections && \
    echo "mariadb-server-10.1 mysql-server/root_password_again password insecure" | debconf-set-selections && \
    echo "mariadb-server-10.1 mysql-server/root_password password insecure" | debconf-set-selections && \
    apt-get install -y mariadb-server && \

    apt-get remove -y ${PACKAGES_FOR_BUILD} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc /usr/share/man

COPY my.cnf /etc/mysql/my.cnf
COPY entrypoint.sh /entrypoint.sh

RUN chown mysql:mysql /etc/mysql/my.cnf && \
    chmod 0744 /etc/mysql/my.cnf

EXPOSE 3306

VOLUME ["/mnt/data/mariadb"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]