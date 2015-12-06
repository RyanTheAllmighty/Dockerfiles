#!/bin/bash

# Exit if any non 0 is returned
set -e

# If command starts with an option, prepend our command
if [ "${1:0:1}" = '-' ]; then
	set -- php "$@"
fi

# Set the environment variables we shall use
USE_REDIS_FOR_SESSIONS=${USE_REDIS_FOR_SESSIONS:=false}

# If we're not using Redis for sessions, then remove those lines
if [ $USE_REDIS_FOR_SESSIONS = 'false' ]; then
    sed -i '/^session.save_handler/d' /usr/local/etc/php/conf.d/custom.ini
    sed -i '/^session.save_path/d' /usr/local/etc/php/conf.d/custom.ini
fi

# Change owner of the PHP logs directory to the www-data user
if [ -d /mnt/logs/php ]; then
    chown -R www-data:www-data /mnt/logs/php
fi

exec $@