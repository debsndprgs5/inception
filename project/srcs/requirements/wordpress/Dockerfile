FROM debian:buster

# Install basic requirements
RUN apt update -y
RUN apt upgrade -y
RUN apt install vim -y

#Install wget and php
RUN apt-get -y install wget
RUN apt-get install -y php7.3
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client

#Install WordPress (PATH = /var/www as it's the main folder for NGINX)
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

#Extract WordPress
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

#Copy my php config
COPY conf/php.ini	/etc/php/7.3/cli/php.ini

#Time to config wordpress, install a CLI to config it quickly
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#Run the config script
COPY tools/auto_config.sh /home/
RUN chmod +x /home/auto_config.sh
ENTRYPOINT [ "/home/auto_config.sh" ]

