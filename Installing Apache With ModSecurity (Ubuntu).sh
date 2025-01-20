#!/bin/bash 
apt update -y # Refreshing the system repository 
apt install software-properties-common -y # Install the tool to manage software repositories 
add-apt-repository ppa:ondrej/apache2 -y # Add the Apache Stable P.P.A. (Personal Package Archive) 
apt update -y # Refreshing the system repository again 
apt install apache2 -y # Install Apache 
ufw allow 'Apache Full' # Allow for both http (80) & https (443) connections 
a2enmod headers # Module that helps control as well as modify HTTP request & response headers 
systemctl restart apache2 
apache2 -v # Verify the Apache installation 
apt install libapache2-mod-security2 -y # Install ModSecurity 
a2enmod security2 # Enable ModSecurity 
systemctl restart apache2 
apt-cache show libapache2-mod-security2 | grep -E '(Version|Package)' # Displays the installed software version 
mv /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf # Move the default ModSecurity configuration file to a new file 
sed -ie 's/^\s*SecRuleEngine DetectionOnly/SecRuleEngine On/' /etc/modsecurity/modsecurity.conf 
sed -ie 's/^\s*SecAuditLogParts ABDEFHIJZ/SecAuditLogParts ABCEFHJKZ/' /etc/modsecurity/modsecurity.conf 
rm -rf /usr/share/modsecurity-crs # Remove the default CRS 
git clone https://github.com/coreruleset/coreruleset/ /usr/share/modsecurity-crs # Clone the latest OWASP CRS from GitHub to the /usr/share/ directory 
mv /usr/share/modsecurity-crs/crs-setup.conf.example /usr/share/modsecurity-crs/crs-setup.conf # Rename the example setup file 
systemctl restart apache2 
# end of script 