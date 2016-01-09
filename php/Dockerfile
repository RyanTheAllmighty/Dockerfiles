# Created and maintained by RyanTheAllmighty
# https://github.com/RyanTheAllmighty/Dockerfiles/tree/master/node

FROM debian:jessie
MAINTAINER Ryan Dowling <ryan@ryandowling.me>

# The version of PHP we want to build and use
ARG VERSION

# The packages we want to install from the package manager and keep
ENV PACKAGES_FOR_INSTALL 'git ca-certificates curl libgd3 libmcrypt4 libpcre3 libsqlite3-0 libxml2 bzip2 librecode-dev'

# The packages we want to install from the package manager to use to build and remove after we're done
ENV PACKAGES_FOR_BUILD 'file g++ gcc make pkg-config autoconf re2c libcurl4-openssl-dev libpcre3-dev libreadline6-dev libsqlite3-dev libssl-dev libxml2-dev xz-utils libzip-dev libbz2-dev libgd-dev libmcrypt-dev libedit-dev'

# This ensures that a version argument has to be passed into the build
RUN if [ -z "$VERSION" ]; then echo "VERSION must be set!"; exit 1; fi

# Get the packages installed, removed, cleaned up as well as build and install PHP
RUN set -x && \

    apt-get update && \
    apt-get install -y ${PACKAGES_FOR_INSTALL} ${PACKAGES_FOR_BUILD} && \

    mkdir -p /usr/local/etc/php/conf.d && \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 0BD78B5F97500D450838F95DFE857D9A90D90EC1 && \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 6E4F6AB321FDC07F2C332E3AC2BF0BC433CFC8B3 && \
    mkdir -p /usr/src/php && \
    curl -SL "http://php.net/get/php-${VERSION}.tar.xz/from/this/mirror" -o php-${VERSION}.tar.xz && \
    tar -xof php-${VERSION}.tar.xz -C /usr/src/php --strip-components=1 && \
    rm php-${VERSION}.tar.xz* && \

    cd /usr/src/php && \
    ./configure --with-config-file-path="/usr/local/etc/php" --with-config-file-scan-dir="/usr/local/etc/php/conf.d" --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data --with-recode \
                --disable-cgi --enable-mysqlnd --enable-mbstring --with-curl --with-openssl --with-readline --with-zlib --with-mcrypt --with-mhash --with-gettext --enable-exif --enable-zip \
                --with-bz2 --enable-soap --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-shmop --with-pear --with-mysqli=mysqlnd --with-mysql-sock --with-gd \
                --with-xmlrpc --enable-bcmath --enable-calendar --enable-ftp --enable-gd-native-ttf --with-freetype-dir=lib64 --with-jpeg-dir=lib64 --with-png-dir=lib64 --with-xpm-dir=lib64 \
                --enable-pdo --with-pdo-sqlite --with-pdo-mysql=mysqlnd --enable-inline-optimization --with-kerberos --with-libedit && \
    make -j $(nproc) && \
    make install && \

    mkdir -p /usr/src/xdebug && \
    curl -SL "http://xdebug.org/files/xdebug-2.4.0rc3.tgz" -o xdebug-2.4.0rc3.tgz && \
    tar -xvzf xdebug-2.4.0rc3.tgz -C /usr/src/xdebug --strip-components=1 && \
    rm xdebug-2.4.0rc3.tgz && \

    cd /usr/src/xdebug && \
    phpize && \
    ./configure && \
    make && \
    cp modules/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012 && \

    apt-get remove -y ${PACKAGES_FOR_BUILD} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/src /usr/lib/gcc /usr/share/doc /usr/share/man

COPY custom.ini /usr/local/etc/php/conf.d/custom.ini
COPY php-fpm.conf /usr/local/etc/php-fpm.conf
COPY entrypoint.sh /entrypoint.sh

RUN chown www-data:www-data /usr/local/etc/php-fpm.conf && \
    chown www-data:www-data /usr/local/etc/php/conf.d/custom.ini

EXPOSE 9000

VOLUME ["/mnt/logs/php"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php"]