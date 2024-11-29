FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server \
    mariadb-client

#Allow to run the daemon of mysql
# Purge and re-create /var/lib/mysql with appropriate ownership
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Give the right to execute + launch the .sh

COPY ./tools/databasemaker.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/databasemaker.sh

ENTRYPOINT [ "/usr/local/bin/databasemaker.sh" ]
