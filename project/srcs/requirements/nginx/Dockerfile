FROM debian:buster

# Install basic requirements
RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install vim -y

WORKDIR /var/www/html

# Create folder to keep the key/certificate for TSL secure connection

RUN mkdir -p /etc/nginx/ssl

# Install OpenSSL for SSL certificate creation and management

RUN apt install openssl -y

# Generate SSL certificate (needed to make TSL/SSL certif)
#-------------------------------------------------------
# req = generate certif
# -x509 = certif type
# -nodes = no password asked
# -out = path to where the certif will be saved
# -keyout = path to where the certif key will be saved
# -subj = adds mandatory informations for certificate as :
# C = Country ID (FR)
# ST = State (PACA)
# L = City (Nice)
# O = Organization name (42)
# OU = Organization Unit Name (42Nice)
# CN = Common Name (zfavere.42.fr)
# UID = Mail address
#-------------------------------------------------------

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=PACA/L=Nice/O=42/OU=42Nice/CN=zfavere.42.fr/UID=zfavere@student.42nice.fr"

COPY    ./conf/default.template /etc/nginx/http.d/default.template

COPY    ./conf/entrypoint.sh /entrypoint.sh
RUN     chmod +x /entrypoint.sh
CMD     ["sh", "/entrypoint.sh"]

EXPOSE  $NGINX_PORT
