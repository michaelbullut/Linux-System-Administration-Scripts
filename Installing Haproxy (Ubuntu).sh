#!/bin/bash 
apt update -y # Refreshing the system repository 
apt install software-properties-common -y # Install the tool to manage software repositories 
add-apt-repository ppa:vbernat/haproxy-3.0 -y # Add Official Haproxy 3.0 LTS Repository 
apt update -y # Refreshing the system repository again 
apt install -y haproxy # Install Haproxy 
ufw allow http/tcp && ufw allow https/tcp # Allow for both http (80) & https (443) connections 
haproxy -v # Verify the Haproxy installation 
# end of script 