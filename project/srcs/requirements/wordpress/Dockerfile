FROM debian:buster

ARG 		WP_PHP_USER
ARG 		WP_PHP_GROUP

ENV 		WP_PHP_USER=$WP_PHP_USER
ENV 		WP_PHP_GROUP=$WP_PHP_GROUP

# Install all requirements

RUN			apk update && apk upgrade && apk add --no-cache \
				wget				\
				tar                 \
				mariadb-client		\
				redis				\
				curl 				\
				php7				\
				php7-fpm			\
				php7-bcmath			\
				php7-bz2 			\
				php7-calendar		\
				php7-cgi			\
				php7-ctype			\
				php7-common			\
				php7-curl			\
				php7-gettext		\
				php7-dom			\
				php7-exif			\
				php7-fileinfo		\
				php7-gd				\
				php7-gmagick		\
				php7-gmp			\
				php7-iconv			\
				php7-imap			\
				php7-intl			\
				php7-json			\
				php7-mbstring		\
				php7-mcrypt			\
				php7-memcache		\
				php7-mysqli			\
				php7-mysqlnd		\
				php7-ldap			\
				php7-opcache		\
				php7-openssl		\
				php7-pcntl			\
				php7-pdo			\
				php7-pdo_mysql		\
				php7-pdo_pgsql		\
				php7-pdo_sqlite 	\
				php7-pgsql			\
				php7-phar			\
				php7-posix			\
				php7-redis			\	
				php7-session		\
				php7-shmop			\
				php7-simplexml		\
				php7-soap			\
				php7-sockets		\
				php7-sodium			\
				php7-sqlite3		\
				php7-sysvsem		\
				php7-sysvshm		\
				php7-tokenizer		\
				php7-xml			\
				php7-xmlreader		\
				php7-xmlrpc			\
				php7-xmlwriter		\
				php7-xsl			\
				php7-zip			\
				php7-zlib			\
				gettext

#Add php user

RUN 		adduser -S $WP_PHP_USER && addgroup -S $WP_PHP_GROUP


#Copy my conf

COPY		./conf/* ./

#Install CLI

RUN			curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv -f wp-cli.phar /usr/local/bin/wp

#Run script

RUN			chmod 777 auto_config.sh
ENTRYPOINT	["sh", "auto_config.sh"]

CMD			["php-fpm7", "-F"]

EXPOSE		$WP_PORT