#!/bin/sh

# Initialisation de la base de données
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Démarrage de MariaDB en arrière-plan
mysqld_safe --datadir=/var/lib/mysql &
sleep 5

# Vérifier si la base de données existe
if [ -d "/var/lib/mysql/$DB_NAME" ]; then
    echo "Database already exists"
else
    echo "Setting up the database..."

    # Définir un mot de passe root sécurisé
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD'; FLUSH PRIVILEGES;" | mysql -u root

    # Ajouter un utilisateur root pour les connexions distantes
    echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PWD'; FLUSH PRIVILEGES;" | mysql -u root

    # Créer la base de données et un utilisateur associé
    echo "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD'; FLUSH PRIVILEGES;" | mysql -u root
fi

# Garder MariaDB actif
wait