FROM debian:buster
ENV DEBIAN_FRONTEND=noninteractive

# Install basic requirements
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install apt-utils -y
RUN apt-get install -y mariadb-server \
    mariadb-client \
    vim \
    && rm -rf /var/lib/apt/lists/*

#Allow to run the daemon of mysql
# Purge and re-create /var/lib/mysql with appropriate ownership
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

# Copy my version of mysql config files to the container
# COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# Copy the script to create the database to the container
COPY tools/databasemaker.sh	/home/
RUN chmod +x /home/databasemaker.sh

# Start the script to create the database
CMD [ "/home/databasemaker.sh" ]

#Command to enable the database to listen

EXPOSE $DB_PORT