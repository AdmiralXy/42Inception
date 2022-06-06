#!/bin/sh

TABLE_PATH="/var/lib/mysql/$DB_NAME"

if ! [ -d $TABLE_PATH ]; then
    echo "-- [42Inception] First startup configuring... --"
    service mysql start
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8;"
    mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysqladmin -u root password $DB_ROOT_PASSWORD
    service mysql stop
fi
/usr/bin/mysqld_safe