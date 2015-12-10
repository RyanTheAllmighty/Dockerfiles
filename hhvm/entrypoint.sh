#!/bin/bash

# Exit if any non 0 is returned
set -e

# If command starts with an option, prepend our command
if [ "${1:0:1}" = '-' ]; then
	set -- hhvm "$@"
fi

# Set the environment variables we shall use
USE_REDIS_FOR_SESSIONS=${USE_REDIS_FOR_SESSIONS:=false}

# If we're not using Redis for sessions, then remove those lines
if [ $USE_REDIS_FOR_SESSIONS = 'false' ]; then
    sed -i '/^session.save_handler/d' /etc/hhvm/server.ini
    sed -i '/^session.save_path/d' /etc/hhvm/server.ini
fi

exec $@