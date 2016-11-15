#!/usr/bin/env bash

set -e

# create document root directory and index.html
mkdir -p $DEFAULT_DOCUMENT_ROOT
echo "Hello World" > $DEFAULT_DOCUMENT_ROOT/index.html

mkdir -p /data/conf/nginx/conf.d
mkdir -p /data/conf/nginx/hosts.d
mkdir -p /data/conf/nginx/nginx.d
chmod 711 /data/conf/nginx

mkdir -p /data/tmp/nginx/client_temp
mkdir -p /data/tmp/nginx/proxy_temp
mkdir -p /data/tmp/nginx/fastcgi_cache
mkdir -p /data/tmp/nginx/fastcgi_cache_tmp
chmod 711 /data/tmp/nginx

mkdir -p /data/www
chown -R www:www /data/www
