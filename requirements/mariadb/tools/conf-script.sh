#!/bin/sh

mysqld &

while [ ! -S /run/mysqld/mysqld.sock ]; do
    echo "Waiting for MariaDB socket..."
    sleep 1
done

mysql -u"${ROOT_USER}" -p"${ROOT_PWD}" -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -u"${ROOT_USER}" -p"${ROOT_PWD}" -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${USER_PWD}';"
mysql -u"${ROOT_USER}" -p"${ROOT_PWD}" -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' WITH GRANT OPTION;"
mysql -u"${ROOT_USER}" -p"${ROOT_PWD}" -e "ALTER USER '${ROOT_USER}'@'localhost' IDENTIFIED BY '${ROOT_PWD}'";
mysql -u"${ROOT_USER}" -p"${ROOT_PWD}" -e "FLUSH PRIVILEGES;"


mysqladmin -u "${ROOT_USER}" -p"${ROOT_PWD}" shutdown


exec mysqld --bind-address=0.0.0.0 --user=mysql --datadir=/var/lib/mysql