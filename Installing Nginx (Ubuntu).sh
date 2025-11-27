#!/bin/bash 
apt update -y # Refreshing the system repository 
apt install software-properties-common -y # Install the tool to manage software repositories 
add-apt-repository ppa:ondrej/nginx -y # Add the Nginx Stable P.P.A. (Personal Package Archive) 
apt update -y # Refreshing the system repository again 
apt install nginx nginx-extras -y # Install Nginx 
ufw allow 'Nginx Full' # Allow for both http (80) & https (443) connections 
nginx -v # Verify the Nginx installation 
# end of script 