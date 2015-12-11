#!/bin/bash

# Exit if any non 0 is returned
set -e

# If command starts with an option, prepend our command
if [ "${1:0:1}" = '-' ]; then
	set -- rethinkdb "$@"
fi

if [ ! -d /mnt/data/rethinkdb ]; then
    mkdir -p /mnt/data/rethinkdb
fi

chown -R rethinkdb:rethinkdb /mnt/data/rethinkdb

exec $@