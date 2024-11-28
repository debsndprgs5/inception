FROM debian:buster

# Installation des dépendances nécessaires
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

# Installation de WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copier la configuration .conf en tant que template
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf.template

# Substitution des variables d'environnement dans le fichier de configuration
RUN envsubst < /etc/php/7.3/fpm/pool.d/www.conf.template > /etc/php/7.3/fpm/pool.d/www.conf && \
    rm /etc/php/7.3/fpm/pool.d/www.conf.template

# Création du répertoire nécessaire pour php-fpm
RUN mkdir /run/php

# Copier le script de création de WordPress et donner les permissions
COPY ./tools/create_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wp.sh
ENTRYPOINT ["/usr/local/bin/create_wp.sh"]

# Définir le répertoire de travail
WORKDIR /var/www/html/

# Exposer le port 9000
EXPOSE 9000

# Lancer PHP-FPM en mode premier-plan
CMD ["/usr/sbin/php-fpm7.3", "-F"]
