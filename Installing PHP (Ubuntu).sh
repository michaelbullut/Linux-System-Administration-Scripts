#!/bin/bash 
apt update -y # Refreshing the system repository 
apt install software-properties-common -y # Install the tool to manage software repositories 
add-apt-repository ppa:ondrej/php -y # Add the PHP Stable P.P.A. (Personal Package Archive) 
apt update -y # Refreshing the system repository again 
apt install php8.4 php8.4-fpm php8.4-mbstring php-pear -y #libapache2-mod-php8.4 -y # Install PHP, PHP-FPM, PHP Extensions & PHP as an Apache module 
php -v # Verify the PHP installation 
# end of script 