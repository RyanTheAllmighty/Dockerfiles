#!/bin/bash

# Exit if any non 0 is returned
set -e

# If command starts with an option, prepend our command
if [ "${1:0:1}" = '-' ]; then
	set -- hhvm "$@"
fi

# Set the environment variables we shall use
USE_REDIS_FOR_SESSIONS=${USE_REDIS_FOR_SESSIONS:=false}

# Create the log folders if doesn't exist
if [ ! -d /mnt/logs/hhvm ]; then
    mkdir -p /mnt/logs/hhvm
fi

# Create the hhvm error.log file if it doesn't exist
if [ ! -f /mnt/logs/hhvm/error.log ]; then
    touch /mnt/logs/hhvm/error.log
fi

# If we're not using Redis for sessions, then remove those lines
if [ $USE_REDIS_FOR_SESSIONS = 'false' ]; then
    sed -i '/^session.save_handler/d' /etc/hhvm/server.ini
    sed -i '/^session.save_path/d' /etc/hhvm/server.ini
fi

# Change owner of the HHVM logs directory to the www-data user
if [ -d /mnt/logs/hhvm ]; then
    chown -R www-data:www-data /mnt/logs/hhvm
fi

exec $@