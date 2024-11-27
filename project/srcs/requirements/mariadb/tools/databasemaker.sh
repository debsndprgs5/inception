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

    # Configurer un mot de passe root explicite
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD'; FLUSH PRIVILEGES;" | mysql -u root

    # Ajouter un utilisateur root distant
    echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PWD'; FLUSH PRIVILEGES;" | mysql -u root -p$DB_ROOT_PWD

    # Créer une base de données et un utilisateur associé
    echo "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD'; FLUSH PRIVILEGES;" | mysql -u root -p$DB_ROOT_PWD

fi

# Garder MariaDB actif
wait
