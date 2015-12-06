#!/bin/bash

# Exit if any non 0 is returned
set -e

# If command starts with an option, prepend our command
if [ "${1:0:1}" = '-' ]; then
	set -- rethinkdb "$@"
fi

# Create the RethinkDB log directory if it doesn't exist
if [ ! -d /mnt/logs/rethinkdb ]; then
    mkdir -p /mnt/logs/rethinkdb
fi

# Create the RethinkDB log file if it doesn't exist
if [ ! -f /mnt/logs/rethinkdb/rethinkdb.log ]; then
    touch /mnt/logs/rethinkdb/rethinkdb.log
fi

# Change owner of the RethinkDB data and logs directory to the rethinkdb user
if [ -d /mnt/logs/rethinkdb ]; then
    chown -R rethinkdb:rethinkdb /mnt/logs/rethinkdb
fi

if [ -d /mnt/data/rethinkdb ]; then
    chown -R rethinkdb:rethinkdb /mnt/data/rethinkdb
fi

exec $@