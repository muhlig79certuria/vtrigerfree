FROM php:5.6-apache

RUN docker-php-ext-install mysqli

WORKDIR /var/www/html

RUN wget -O vtiger.tar.gz "https://downloads.sourceforge.net/project/vtigercrm/vtiger%20CRM%206.0.0/Core%20Product/vtigercrm6.0.0.tar.gz" && \
    tar -xzf vtiger.tar.gz --strip-components=1 && \
    rm vtiger.tar.gz
