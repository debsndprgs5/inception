#!/bin/sh

#Check if wp-config.php exists

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Inport env variables in the config file
	sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$DB_USER_PWD/g" wp-config-sample.php
	sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
fi

envsubst '${WP_PHP_USER} ${WP_PHP_GROUP} ${WP_PHP_LISTEN_OWNER} ${WP_PHP_LISTEN_GROUP}' < /etc/php/7.3/fpm/pool.d/www.conf > /etc/php/7.3/fpm/pool.d/www.conf

exec "$@"