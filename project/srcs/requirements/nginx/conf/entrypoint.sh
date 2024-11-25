#!/bin/bash

envsubst < /etc/nginx/conf.d/nginx.conf
exec nginx -g "daemon off;"