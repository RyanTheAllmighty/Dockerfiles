#!/bin/bash

# Exit if any non 0 is returned
set -e

# If command starts with an option, prepend our command
if [ "${1:0:1}" = '-' ]; then
	set -- redis-server "$@"
fi

# Chown this directory to redis
chown -R redis .

exec gosu redis $@