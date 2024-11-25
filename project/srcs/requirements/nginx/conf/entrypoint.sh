#!/bin/bash

envsubst < /etc/nginx/http.d/default.template
exec nginx -g "daemon off;"