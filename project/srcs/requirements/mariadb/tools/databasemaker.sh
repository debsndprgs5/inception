#!/bin/sh

# Initialisation de MariaDB
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Démarrer MariaDB
mysqld_safe --datadir=/var/lib/mysql &
sleep 5

# Vérifier si la base de données existe
if [ -d "/var/lib/mysql/$DB_NAME" ]; then
    echo "Database already exists"
else
    echo "Setting up the database..."

mysql_secure_installation << _EOF_

Y
root4life
root4life
Y
n
Y
Y
_EOF_

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD'" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root
echo "ALTER USER '$DB_ROOT'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';" | mysql -u root --password=${DB_ROOT_PWD}
echo "Done setting up the db."

fi

/etc/init.d/mysql stop

exec "$@"