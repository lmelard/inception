#!/bin/bash

sleep 10

#on verifie 
if [ ! -f /var/www/wordpress/wp-config.php ];

then
	wp config create --allow-root \
			--dbname=$SQL_DATABASE \
			--dbuser=$SQL_USER \
			--dbpass=$SQL_PASSWORD \
			--dbhost=mariadb:3306 --path='/var/www/wordpress'
	sleep 2

# on configure le premier utilisateur wordpress

	wp core install --url=$URL_SITE \
		--title=$TITLE_SITE \
		--admin_user=$ADMIN_NAME \
		--admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_MAIL \
		--allow-root \
		--path='/var/www/wordpress'

	
#on configure le deuxieme utilisateur wordpress qui aura le role d'auteru
	wp user create --allow-root \
		--role=author \
			$USER_NAME \
			$USER_MAIL \
		--user_pass=$USER_PASS \
		--path='/var/www/wordpress'

fi

#on verifie que le repertoire existe. Si non on le cree
if [ ! -d /run/php ];

then
	mkdir /run/php;

fi

#demarre le serveur PHP-FPM pour executer wordpress
/usr/sbin/php-fpm7.3 -F