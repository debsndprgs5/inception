FROM debian:buster

# Install basic requirements
RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install vim -y

# Install MariaDB
RUN apt-get install mariadb-server -y
RUN apt-get install mariadb-client -y

# Copy my version of mysql config files to the container
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# Copy the script to create the database to the container
COPY tools/databasemaker.sh	/home/
RUN chmod +x /home/databasemaker.sh

# Start the script to create the database
CMD [ "/home/databasemaker.sh" ]

#Command to enable the database to listen

EXPOSE $DB_PORT