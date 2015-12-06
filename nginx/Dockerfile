# Created and maintained by RyanTheAllmighty
# https://github.com/RyanTheAllmighty/Dockerfiles

FROM debian:jessie
MAINTAINER Ryan Dowling <ryan@ryandowling.me>

# The version of nginx we want to build and use
ENV VERSION=1.9.7

# The packages we want to install from the package manager and keep
ENV PACKAGES_FOR_INSTALL 'libpcre3 geoip-bin ca-certificates'

# The packages we want to install from the package manager to use to build and remove after we're done
ENV PACKAGES_FOR_BUILD 'curl make g++ gcc libpcre3-dev libssl-dev libgeoip-dev'

# Get the packages installed, removed, cleaned up as well as build and install Nginx
RUN set -x && \

    groupadd -r nginx && \
    useradd -r -g nginx nginx && \

    apt-get update && \
    apt-get install -y ${PACKAGES_FOR_INSTALL} ${PACKAGES_FOR_BUILD} && \

    mkdir -p /usr/src/nginx && \
    cd /usr/src/nginx && \
    curl -SL "http://nginx.org/download/nginx-${VERSION}.tar.gz" -o nginx-${VERSION}.tar.gz && \
    tar zvxf nginx-${VERSION}.tar.gz && \
    rm -f nginx-${VERSION}.tar.gz && \
    cd nginx-${VERSION} && \

    mkdir -p /var/log/nginx && \
    mkdir -p /etc/nginx && \
    mkdir -p /etc/nginx/conf.d/ && \
    mkdir -p /etc/nginx/sites.d/ && \
    mkdir -p /var/cache/nginx/client_temp && \
    mkdir -p /var/cache/nginx/proxy_temp && \
    mkdir -p /var/cache/nginx/fastcgi_temp && \
    mkdir -p /var/cache/nginx/uwsgi_temp && \
    mkdir -p /var/cache/nginx/scgi_temp && \

    cd /usr/src/nginx/nginx-${VERSION} && \
    ./configure --prefix=/etc/nginx \
                --sbin-path=/usr/sbin/nginx \
                --user=nginx \
                --group=nginx \
                --conf-path=/etc/nginx/nginx.conf \
                --error-log-path=/var/log/nginx/error.log \
                --http-log-path=/var/log/nginx/access.log \
                --pid-path=/var/run/nginx.pid \
                --lock-path=/var/run/nginx.lock \
                --http-client-body-temp-path=/var/cache/nginx/client_temp \
                --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
                --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
                --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
                --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
                --with-http_ssl_module \
                --with-http_realip_module \
                --with-http_addition_module \
                --with-http_sub_module \
                --with-http_dav_module \
                --with-http_flv_module \
                --with-http_mp4_module \
                --with-http_gunzip_module \
                --with-http_gzip_static_module \
                --with-http_random_index_module \
                --with-http_secure_link_module \
                --with-http_stub_status_module \
                --with-http_auth_request_module \
                --with-threads \
                --with-stream \
                --with-stream_ssl_module \
                --with-mail \
                --with-mail_ssl_module \
                --with-file-aio \
                --with-http_v2_module \
                --with-ipv6 \
                --with-http_geoip_module && \
    make -j $(nproc) && \
    make install && \

    apt-get remove -y ${PACKAGES_FOR_BUILD} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/src /usr/lib/gcc /usr/share/doc /usr/share/man

COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/*.conf /etc/nginx/conf.d/
COPY entrypoint.sh /entrypoint.sh

RUN chown -R nginx:nginx /etc/nginx && \
    chown -R nginx:nginx /var/cache/nginx

EXPOSE 80 443

VOLUME ["/mnt/logs/nginx"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx"]