#!/bin/bash

# Exit if any non 0 is returned
set -e

# If command starts with an option, prepend our command
if [ "${1:0:1}" = '-' ]; then
	set -- nginx "$@"
fi

# Touch the nginx.pid file if it doesn't exist otherwise it will fail to startup
if [ ! -f /var/run/nginx.pid ]; then
    touch /var/run/nginx.pid
fi

# Change owner of the site directory to the nginx user and group
if [ -d /mnt/site ]; then
    chown -R nginx:nginx /mnt/site
fi

# Change owner of the nginx pid file to the nginx user and group
chown nginx:nginx /run/nginx.pid

exec $@