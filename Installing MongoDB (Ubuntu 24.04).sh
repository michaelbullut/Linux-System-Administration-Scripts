#!/bin/bash 
apt update -y # Refreshing the system repository 
wget -qO - https://www.mongodb.org/static/pgp/server-8.0.asc | sudo apt-key add - # Latest MongoDB Release Key (Can be adjusted for any desired version) 
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
apt update -y # Refreshing the system repository again 
apt install mongodb-org -y # Install MongoDB 
systemctl enable --now mongod 
ufw allow 27017/tcp # Allow for remote access (optional) 
mongod --version # Verify the MongoDB installation 
# end of script 
