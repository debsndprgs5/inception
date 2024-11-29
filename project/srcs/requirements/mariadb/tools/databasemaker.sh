#!/bin/sh

# Vérifier si la base de données existe
if [ -d "/var/lib/mysql/$DB_NAME" ]; then
    echo "Database already exists"
else
    echo "Setting up the database..."

service mysql start
mysql -uroot<<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
UPDATE mysql.user SET Password = PASSWORD('$DB_ROOT_PWD') WHERE User = 'root';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
FLUSH PRIVILEGES;
QUIT
EOF

echo "Done setting up the db."
sleep 5
service mysql stop
fi
sleep 5
mysqld_safe --datadir=/var/lib/mysql
