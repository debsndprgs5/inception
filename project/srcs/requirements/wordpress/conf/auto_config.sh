#!/bin/bash

envsubst '${WP_PHP_USER} ${WP_PHP_GROUP} ${WP_PHP_LISTEN_OWNER} ${WP_PHP_LISTEN_GROUP}' < ./www.conf.template > ./www.conf

chmod 777 /var/www/html

# Check if WordPress is already downloaded
if [ ! -f /var/www/html/wp-config.php ]; then
    echo "Downloading WordPress core..."
    wp core download --allow-root --path="/var/www/html"
else
    echo "WordPress core already present, skipping download."
fi

# Remove any existing 'wp-config.php7'
rm -f /var/www/html/wp-config.php7

# Check and create PHP-FPM directory if necessary
mkdir -p /etc/php/7.3/fpm/pool.d/
cp ./wp-config.php /var/www/html/wp-config.php
cp ./www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Wait for the database to be ready
until mysqladmin ping -h"$DB_HOST" --silent; do
    echo "Waiting for database connection..."
    sleep 2
done

# Install WordPress core if not already installed
if ! wp core is-installed --path="/var/www/html" --allow-root; then
    echo "Installing WordPress..."
    wp core install --url=${DOMAIN_NAME} --title="Inception" --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --path="/var/www/html" --allow-root --skip-email
else
    echo "WordPress already installed."
fi

# Create WordPress user if it doesn’t exist
wp --allow-root user create ${DB_USER} ${WP_USER_EMAIL} --role="author" --user_pass=${DB_USER_PWD} --path="/var/www/html" || echo "User already exists."

# Start PHP-FPM
php-fpm7.3 -D
