#!/bin/bash

envsubst '${DOMAIN_NAME} ${NGINX_PORT} ${WP_PORT}' < /etc/nginx/conf.d/nginx.conf
exec nginx -g "daemon off;"