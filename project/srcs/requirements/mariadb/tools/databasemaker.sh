#!/bin/bash

#-------------------------------------------------------
# Start MySQL
#
mysql_install_db
#
/etc/init.d/mysql start
#-------------------------------------------------------

# Wait for mysql to be started
until mysqladmin ping -h localhost --silent; do
    echo 'Waiting for MySQL to be ready...'
    sleep 1
done

#-------------------------------------------------------
# Create (if it doesnt already exist) a new database named after
# env_var "SQL_DATABASE" declared in .env that'll be sent by 
# docker-compose.yml
#
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
#-------------------------------------------------------

#-------------------------------------------------------
# Create a new SQL User that will be able to edit the db
# named after env_var SQL_USER with env_var SQL_PASSWORD as pswd
#
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
#-------------------------------------------------------

#-------------------------------------------------------
# Grant divine power to the new user for the SQL_DATABASE
#
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
#-------------------------------------------------------

#-------------------------------------------------------
# Modify root user with localhost rights
#
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
#-------------------------------------------------------

#-------------------------------------------------------
# Refresh
#
mysql -e "FLUSH PRIVILEGES;"
#-------------------------------------------------------

#-------------------------------------------------------
# Restart MySQL
#
mysqladmin -u root -p $SQL_ROOT_PASSWORD shutdown
exec mysqld_safe
#-------------------------------------------------------
exec "$@"