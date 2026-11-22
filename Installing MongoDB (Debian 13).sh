#!/bin/bash 
apt update -y # Refreshing the system repository 
curl -fsSL https://pgp.mongodb.com/server-9.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-9.0.gpg --dearmor # Latest MongoDB Release Key (Can be adjusted for any desired version) 
echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-9.0.gpg ] https://repo.mongodb.org/apt/debian trixie/mongodb-org/9.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-9.0.list 
apt update -y # Refreshing the system repository again 
apt install mongodb-org -y # Install MongoDB 
systemctl enable --now mongod 
ufw allow 27017/tcp # Allow for remote access (optional) 
mongod --version # Verify the MongoDB installation 
# end of script 