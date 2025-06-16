FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y apache2 php5.6 php5.6-mysql libapache2-mod-php5.6 \
    php5.6-curl php5.6-gd php5.6-mbstring php5.6-xml php5.6-zip \
    unzip wget

WORKDIR /var/www/html

RUN wget https://sourceforge.net/projects/vtigercrm/files/vtiger%20CRM%206.0.0/Core%20Product/vtigercrm600.tar.gz && \
    tar -xvzf vtigercrm600.tar.gz && \
    mv vtigercrm /var/www/html/vtiger && \
    chown -R www-data:www-data /var/www/html/vtiger && \
    rm vtigercrm600.tar.gz

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
