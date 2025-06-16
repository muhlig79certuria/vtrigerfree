FROM ubuntu:18.04

# Installiere benötigte Tools und PHP 5.6 + Apache
RUN apt-get update && \
    apt-get install -y software-properties-common curl gnupg2 && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        apache2 php5.6 php5.6-mysql libapache2-mod-php5.6 \
        php5.6-curl php5.6-gd php5.6-mbstring php5.6-xml php5.6-zip \
        unzip wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Lade Vtiger und entpacke es
RUN wget -O /tmp/vtiger.zip https://sourceforge.net/projects/vtigercrm/files/vtiger CRM 7.1.0/Core Product/vtigercrm7.1.0.tar.gz/download && \
    mkdir -p /var/www/html && \
    tar -xzf /tmp/vtiger.zip -C /var/www/html --strip-components=1 && \
    rm /tmp/vtiger.zip

# Berechtigungen setzen
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
