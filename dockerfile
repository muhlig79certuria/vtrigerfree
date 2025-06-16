FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y software-properties-common curl gnupg2 && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 php5.6 \
    php5.6-mysql libapache2-mod-php5.6 php5.6-curl php5.6-gd \
    php5.6-mbstring php5.6-xml php5.6-zip unzip wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./vtiger /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
