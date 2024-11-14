#!/bin/bash

# Check if the directory doesn't exist
if [ ! -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld

    # Set the owner and group for the directory
    chown mysql:mysql /run/mysqld

    # Set the permissions for the directory to be more restrictive
    chmod 750 /run/mysqld
fi

# Initialize MySQL Data Directory if it hasn't been initialized yet

if [ ! -d "/var/lib/mysql/mysql" ]; then
    chown -R mysql:mysql /var/lib/mysql
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
    tfile=`mktemp`
    if [ ! -f "$tfile" ]; then
        return 1
    fi
    # Create and send init basic settings to a temp file, then used
    # for a mdb bootstrap mode setup
    cat << EOF > $tfile
    USE mysql;
    FLUSH PRIVILEGES;
    DELETE FROM mysql.user WHERE User='';
    DROP DATABASE test;
    DELETE FROM mysql.db WHERE Db='test';
    DELETE FROM mysql.user WHERE User='$DB_ROOT' AND Host NOT IN ('$DB_HOST', '127.0.0.1', '::1');
    ALTER USER 'root'@'$DB_HOST' IDENTIFIED BY '$DB_ROOT_PWDD';
    CREATE DATABASE $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
    CREATE USER '$DB_USER'@'%' IDENTIFIED by '$DB_USER_PWD';
    GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
    GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_USER_PWD';
    FLUSH PRIVILEGES;
EOF
    /usr/bin/mysqld --user=mysql --bootstrap < $tfile
    rm -f $tfile
fi
# Config mariadb to allow external connections & uncommenting skip-networking in mdb conf
sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

# Start MariaDB
service mysql start
