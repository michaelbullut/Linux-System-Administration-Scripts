#!/bin/bash 
apt update -y # Refreshing the system repository 
apt install software-properties-common -y # Install the tool to manage software repositories 
curl -sSLo /tmp/debsuryorg-archive-keyring.deb https://packages.sury.org/debsuryorg-archive-keyring.deb 
dpkg -i /tmp/debsuryorg-archive-keyring.deb
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt update -y # Refreshing the system repository again 
apt install php8.6 php8.6-fpm php8.6-mbstring php-pear -y #php8.6-mysql libapache2-mod-php8.6 -y # Install PHP, PHP-FPM, PHP Extensions & PHP as an Apache module 
php -v # Verify the PHP installation 
# end of script 