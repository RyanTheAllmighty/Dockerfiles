#!/bin/bash

# Exit if any non 0 is returned
set -e

# If command starts with an option, prepend our command
if [ "${1:0:1}" = '-' ]; then
	set -- mysqld "$@"
fi

# Don't do this setup stuff if were not running mysqld
if [ "${1:0:6}" = 'mysqld' ]; then
    # Change the owner/group on the MariaDB data folder so we can use it if it exists
    if [ -d /mnt/data/mariadb ]; then
        chown -R mysql:mysql /mnt/data/mariadb
    fi

    # Check if the mysql folder exists in the data dir, if so then we're probably already setup
    if [ ! -d "/mnt/data/mariadb/mysql" ]; then
        # Make the directories we need
        mkdir -p /mnt/data/mariadb
        chown -R mysql:mysql /mnt/data/mariadb

        # Install the MySQL DB
        mysql_install_db --user=mysql --datadir=/mnt/data/mariadb

        # Start MySQL
        /usr/sbin/mysqld --user=mysql --datadir=/mnt/data/mariadb --skip-networking &

        # The MariaDB PID and MySQL connection
        pid="$!"
        mysql=(mysql --protocol=socket -u root)

        # Wait until it's started up
        for i in {30..0}; do
            if echo 'SELECT 1' | "${mysql[@]}" &> /dev/null; then
                break
            fi

            echo 'MySQL init process in progress...'
            sleep 1
        done

        # We may have failed so check for a 0 PID
        if [ "$i" = 0 ]; then
            echo >&2 'Failed to connect to MySQL!'
            exit 1
        fi

        # Remove all the users and remove the test database
        "${mysql[@]}" <<-EOSQL
        SET @@SESSION.SQL_LOG_BIN=0;

        DELETE FROM mysql.user;
        CREATE USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
        GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;
        DROP DATABASE IF EXISTS test;
        FLUSH PRIVILEGES;
EOSQL

        if [ ! -z "$MYSQL_ROOT_PASSWORD" ]; then
            mysql+=( -p"${MYSQL_ROOT_PASSWORD}" )
        fi

        if [ "$MYSQL_APP_DATABASE" ]; then
            echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_APP_DATABASE}\`;" | "${mysql[@]}"
        fi

        if [ "$MYSQL_APP_USERNAME" -a "$MYSQL_APP_PASSWORD" ]; then
            echo "CREATE USER '${MYSQL_APP_USERNAME}'@'%' IDENTIFIED BY '${MYSQL_APP_PASSWORD}';" | "${mysql[@]}"

            if [ "$MYSQL_APP_DATABASE" ]; then
                echo "GRANT ALL ON \`${MYSQL_APP_DATABASE}\`.* TO '${MYSQL_APP_USERNAME}'@'%';" | "${mysql[@]}"
            fi

            echo "FLUSH PRIVILEGES;" | "${mysql[@]}"
        fi

        # Kill MySQL and wait for it to exit
        if ! kill -s TERM "$pid" || ! wait "$pid" ; then
            echo >&2 'Failed to kill and wait for MySQL to exit!'
            exit 1
        fi
    fi
fi

exec $@