#!/bin/bash 
apt update -y # Refreshing the system repository 
curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /usr/share/keyrings/postgresql-keyring.gpg # Add Official Repository Signing Key 
echo "deb [signed-by=/usr/share/keyrings/postgresql-keyring.gpg] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list # Add Official PostgreSQL Repository 
apt update -y # Refreshing the system repository again 
apt install postgresql postgresql-contrib -y # Install PostgreSQL 
ufw allow 5432/tcp # Allow for remote access (optional)
psql -V # Verify the PostgreSQL installation 
# end of script 
