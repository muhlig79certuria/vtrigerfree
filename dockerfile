FROM php:5.6-apache

RUN apt-get update && \
    apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev zlib1g-dev \
    libxml2-dev unzip wget && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd mysqli pdo pdo_mysql mbstring zip xml && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN wget -q https://downloads.sourceforge.net/project/vtigercrm/vtiger%20CRM%206.0.0/Core%20Product/vtigercrm6.0.0.tar.gz && \
    tar xzf vtigercrm6.0.0.tar.gz --strip 1 && \
    chown -R www-data:www-data /var/www/html && \
    rm vtigercrm6.0.0.tar.gz

EXPOSE 80
