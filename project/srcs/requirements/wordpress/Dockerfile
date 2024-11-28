FROM debian:buster

ARG 		WP_PHP_USER
ARG 		WP_PHP_GROUP

ENV WP_PHP_USER=${WP_PHP_USER}
ENV WP_PHP_GROUP=${WP_PHP_GROUP}

#Add php user & group

RUN	groupadd ${WP_PHP_GROUP} && \
	useradd ${WP_PHP_USER}  && \
	useradd -g ${WP_PHP_GROUP} $WP_PHP_USER


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
    gettext-base \
    && rm -rf /var/lib/apt/lists/*

#We need to install wp-cli and put it in the right dir

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

#Copy the .conf in the html directory

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf.template

#Create the folder to enable php start

RUN mkdir /run/php


#Copy the script, grant access to exe

COPY ./tools/create_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wp.sh
ENTRYPOINT ["/usr/local/bin/create_wp.sh"]


WORKDIR /var/www/html/

EXPOSE 9000

#Launch PHP FPM in foreground and ignore deamonize from conf file with -F flag

CMD ["/usr/sbin/php-fpm7.3", "-F"]
