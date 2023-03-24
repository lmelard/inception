#!/bin/bash

service mysql start;

sleep 3

mysqladmin -u root password $SQL_ROOT_PASSWORD;

mysql -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"

mysql -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' \
	IDENTIFIED BY '$SQL_PASSWORD';"

mysql -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' \
	IDENTIFIED BY '$SQL_PASSWORD';"

mysql -e "DELETE FROM mysql.user WHERE user=''"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe

