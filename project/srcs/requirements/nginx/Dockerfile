FROM	debian:buster

#install all the program
RUN		apt-get update
RUN		apt-get install -y nginx \
                openssl

RUN mkdir -p /etc/nginx/ssl

# Install OpenSSL for SSL certificate creation and management

RUN apt-get install openssl -y

#Transfer my SSL keys
COPY ./ssl/zfavere.crt /etc/nginx/ssl/
COPY ./ssl/zfavere.key /etc/nginx/ssl/

COPY ./conf/nginx.conf /etc/nginx/conf.d/

# nginx config
RUN mkdir -p /run/nginx

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
