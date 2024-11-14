FROM debian:buster

# Declare build arguments and set environment variables
ARG WP_PHP_USER
ARG WP_PHP_GROUP

ENV WP_PHP_USER=${WP_PHP_USER}
ENV WP_PHP_GROUP=${WP_PHP_GROUP}

# Install all requirements

FROM debian:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    wget \
    tar \
    mariadb-client \
    redis \
    curl \
    php \
    php-fpm \
    php-bcmath \
    php-bz2 \
    php-calendar \
    php-cgi \
    php-ctype \
    php-common \
    php-curl \
    php-dom \
    php-exif \
    php-fileinfo \
    php-gd \
    php-imagick \
    php-gmp \
    php-imap \
    php-intl \
    php-json \
    php-mbstring \
    php-memcached \
    php-mysqli \
    php-mysql \
    php-ldap \
    php-opcache \
    php-pdo \
    php-pdo-mysql \
    php-pdo-pgsql \
    php-pdo-sqlite \
    php-pgsql \
    php-phar \
    php-posix \
    php-redis \
    php-shmop \
    php-simplexml \
    php-soap \
    php-sockets \
    php-sqlite3 \
    php-sysvsem \
    php-sysvshm \
    php-tokenizer \
    php-xml \
    php-xmlreader \
    php-xmlrpc \
    php-xmlwriter \
    php-xsl \
    php-zip \
    gettext \
    && apt-get clean && rm -rf /var/lib/apt/lists/*



#Add php user

RUN addgroup "$WP_PHP_GROUP" && \
    adduser --system --ingroup "$WP_PHP_GROUP" "$WP_PHP_USER"



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