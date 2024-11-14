#!/bin/bash

envsubst '${DOMAIN_NAME} ${NGINX_PORT} ${WP_PORT}' < /etc/nginx/http.d/default.template > /etc/nginx/http.d/default.conf
exec nginx -g "daemon off;"