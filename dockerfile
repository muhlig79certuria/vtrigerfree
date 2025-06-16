FROM php:5.6-apache

COPY vtigercrm6.0.0.tar.gz /var/www/html/

WORKDIR /var/www/html

RUN tar -xzf vtigercrm6.0.0.tar.gz --strip-components=1 && \
    rm vtigercrm6.0.0.tar.gz
