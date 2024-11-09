#!/bin/bash

envsubst '${WP_PHP_USER} ${WP_PHP_GROUP} ${WP_PHP_LISTEN_OWNER} ${WP_PHP_LISTEN_GROUP}' < ./www.conf.template > ./www.conf
# Replaces environment variables within the 'www.conf.template' file with their values
# (like WP_PHP_USER, WP_PHP_GROUP, etc.) and outputs the result to 'www.conf'

chmod 777 /var/www/html

ls /var/www/html

wp core download --allow-root --path="/var/www/html"
# Downloads the WordPress core files into '/var/www/html' as the root user
# --allow-root allows running WP-CLI as root (not recommended for production)

rm -f /var/www/html/wp-config.php7
# Removes any existing 'wp-config.php7' file in '/var/www/html' to prevent conflicts

rm -f /etc/php7/php-fpm.d/www.conf
# Removes any existing 'www.conf' configuration file for PHP-FPM to avoid conflicts

cp ./wp-config.php /var/www/html/wp-config.php
# Copies a prepared 'wp-config.php' file from the current directory to '/var/www/html'
# This file is required by WordPress to connect to the database and set configuration options

cp ./www.conf /etc/php7/php-fpm.d/www.conf
# Copies the customized 'www.conf' to the PHP-FPM configuration directory
# This file sets PHP-FPM settings for WordPress

wp core install --url=${DOMAIN_NAME} --title="Inception" --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --path="/var/www/html" --allow-root --skip-email
# Installs WordPress using the WP-CLI with the provided configuration:
# - 'url' is set by the DOMAIN_NAME environment variable
# - 'title' is set to "Inception"
# - 'admin_user', 'admin_password', and 'admin_email' are set from environment variables
# - --path specifies the directory where WordPress is installed
# - --allow-root allows WP-CLI to run as root
# - --skip-email skips sending the admin welcome email

wp --allow-root user create ${MDB_USER} ${WP_USER_EMAIL} --role="author" --user_pass=${MDB_USER_PWD} --path="/var/www/html"
# Creates a new WordPress user with the provided username (MDB_USER), email (WP_USER_EMAIL), and password (MDB_USER_PWD)
# The user's role is set to "author"
# --path specifies the WordPress directory, and --allow-root permits WP-CLI to run as root

$@
# Executes any additional arguments passed to the script at runtime, allowing flexible usage of the script for various commands
