

FROM	debian:buster

#install all the program
RUN		apt-get update
RUN		apt-get install -y nginx \
                openssl

RUN mkdir -p /etc/nginx/ssl

# Install OpenSSL for SSL certificate creation and management

RUN apt-get install openssl -y

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

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/zfavere.crt -keyout /etc/nginx/ssl/zfavere.key -subj "/C=FR/ST=PACA/L=Nice/O=42/OU=42Nice/CN=zfavere.42.fr/UID=zfavere@student.42nice.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d/
RUN ls /etc/nginx/conf.d

# nginx config
RUN mkdir -p /run/nginx

#the only port allowed
EXPOSE	443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]