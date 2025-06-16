FROM php:5.6-apache

WORKDIR /var/www/html

COPY vtigercrm6.0.0.tar.gz .

RUN tar -xzf vtigercrm6.0.0.tar.gz --strip-components=1 && \
    rm vtigercrm6.0.0.tar.gz
