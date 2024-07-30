#!/bin/bash

sleep 10
conf="/var/www/wordpress/wp-config.php"
if [-e "/run/php"]; then
	echo ' '
else
	mkdir /run/php
fi

# Check if the config file already exists
if [ -e "$conf" ]; then
    echo 'config file already exists'
else
	wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'
	exec /usr/sbin/php-fpm7.3 -F
fi

