#!/bin/bash

envsubst \$PORT < /default.conf > /etc/nginx/conf.d/default.conf;

/usr/sbin/nginx -g 'daemon off;'
