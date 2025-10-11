#!/bin/bash 
apt update -y # Refreshing the system repository 
curl -LsS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash -s -- --mariadb-server-version=11.4 # Add Official MariaDB Repository 
apt update -y # Refreshing the system repository again 
apt install mariadb-server mariadb-client -y # Install MariaDB 
ufw allow 3306/tcp # Allow for remote access (optional) 
mariadb --version # Verify the MariaDB installation 
# end of script 