FROM debian:buster

ARG 		WP_PHP_USER
ARG 		WP_PHP_GROUP

ENV 		WP_PHP_USER=$WP_PHP_USER
ENV 		WP_PHP_GROUP=$WP_PHP_GROUP

RUN apt-get update && apt-get -y install \
    wget \
    curl \
    bash \
    php \
    php-cgi \
    php-mysql \
    php-fpm \
    php-pdo \
    php-gd php-cli \
    php-mbstring \
    redis \
    php-redis \
    gettext-base

#We need to install wp-cli and put it in the right dir

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

#Add php user & group

RUN	groupadd $WP_PHP_GROUP && \
	useradd -g $WP_PHP_GROUP $WP_PHP_USER

#Copy the .conf in the html directory

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf.template

#Create the folder to enable php start

RUN mkdir /run/php


#Copy the script, grant access to exe

COPY ./tools/create_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wp.sh
ENTRYPOINT ["/usr/local/bin/create_wp.sh"]


WORKDIR /var/www/html/
