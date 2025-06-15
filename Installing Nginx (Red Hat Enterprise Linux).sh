#!/bin/bash 
yum update -y # Refreshing the system repository 
yum module list nginx 
yum module enable nginx:1.26 -y 
yum install nginx -y # Install Nginx 
ufw allow http/tcp && ufw allow https/tcp # Allow for both http (80) & https (443) connections 
systemctl enable --now nginx 
nginx -v # Verify the Nginx installation 
# end of script 