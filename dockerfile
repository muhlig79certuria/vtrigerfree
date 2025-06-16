FROM php:5.6-apache

RUN apt-get update && apt-get install -y unzip wget

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y unzip wget && \
    wget --content-disposition "https://downloads.sourceforge.net/project/vtigercrm/vtiger%20CRM%206.0.0/Core%20Product/vtigercrm6.0.0.tar.gz" && \
    tar -xzf vtigercrm6.0.0.tar.gz --strip-components=1 && \
    rm vtigercrm6.0.0.tar.gz
