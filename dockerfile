FROM php:5.6-apache

RUN sed -i 's|httpredir.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y unzip wget

WORKDIR /var/www/html

RUN wget --content-disposition "https://downloads.sourceforge.net/project/vtigercrm/vtiger%20CRM%206.0.0/Core%20Product/vtigercrm6.0.0.tar.gz" && \
    tar -xzf vtigercrm6.0.0.tar.gz --strip-components=1 && \
    rm vtigercrm6.0.0.tar.gz
