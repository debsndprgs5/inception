#!/bin/sh

#Check if wp-config.php exists

sleep 5
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	wp core download --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PWD --dbhost=$DB_CONTAINER_NAME --force --allow-root
	wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email
	wp user create $WP_PHP_USER --allow-root $WP_USER_EMAIL --user_pass=$WP_USER_PWD
fi

rm -rf /etc/php/7.3/fpm/pool.d/www.conf
envsubst < /etc/php/7.3/fpm/pool.d/www.conf.template > /etc/php/7.3/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.3 -F 
