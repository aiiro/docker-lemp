FROM aiiro/centos:latest

ADD container-files/etc/yum.repos.d/nginx.repo /etc/yum.repos.d/nginx.repo

RUN \
  yum -y install nginx \
  && yum clean all \

  # rename user-group nginx:nginx to www:www
  && groupmod --new-name www nginx \
  && usermod --home /data/www --login www --shell /bin/bash --comment www nginx \

  && rm -rf /etc/nginx/*.d /etc/nginx/*_params \

  # create dummy ssl certificates
  && mkdir -p /etc/nginx/ssl \
  && openssl genrsa -out /etc/nginx/ssl/dummy.key 2048 \
  && openssl req -new -key /etc/nginx/ssl/dummy.key -out /etc/nginx/ssl/dummy.csr -subj "/C=JP" \
  && openssl x509 -req -days 3650 -in /etc/nginx/ssl/dummy.csr -signkey /etc/nginx/ssl/dummy.key -out /etc/nginx/ssl/dummy.crt

ADD container-files /

ENV \
  DEFAULT_DOCUMENT_ROOT=/data/www/html/public

EXPOSE 80 443

