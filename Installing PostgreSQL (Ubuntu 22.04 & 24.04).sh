#!/bin/bash 
apt update -y # Refreshing the system repository 
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' # Add Official PostgreSQL Repository 
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - # Add Official Repository Signing Key 
apt update -y # Refreshing the system repository again 
apt install postgresql postgresql-contrib -y # Install PostgreSQL 
ufw allow 5432/tcp # Allow for remote access 
psql -V # Verify the PostgreSQL installation 
# end of script 
