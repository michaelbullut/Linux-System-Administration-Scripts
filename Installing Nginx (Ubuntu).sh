#!/bin/bash 
apt update -y # Refreshing the system repository 
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo gpg --dearmor -o /usr/share/keyrings/nginx-archive-keyring.gpg # Download & add the official Nginx signing key to verify package authenticity 
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" | tee /etc/apt/sources.list.d/nginx.list # Add Official Nginx Stable Repository 
curl -fsSL https://apt.blendbyte.net/nginx/blendbyte-archive-keyring.gpg | sudo tee /etc/apt/keyrings/blendbyte.gpg >/dev/null # Download & add the official Blendbyte signing key to verify package authenticity 
echo "deb [signed-by=/etc/apt/keyrings/blendbyte.gpg] https://apt.blendbyte.net/nginx $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/blendbyte.list # Add Official Blendbyte Repository 
apt update -y # Refreshing the system repository again 
apt install -y nginx nginx-module-brotli nginx-module-geoip2 nginx-module-headers-more nginx-module-brotli-static nginx-module-zstd nginx-module-zstd-static nginx-module-stream-geoip2 nginx-module-substitutions nginx-module-cache-purge nginx-module-fancyindex nginx-module-dav-ext nginx-module-modsecurity # Install Nginx and Nginx modules 
systemctl enable --now nginx 
ufw allow http/tcp && ufw allow https/tcp # Allow for both http (80) & https (443) connections 
nginx -v # Verify the Nginx installation 
# end of script 