#!/bin/bash
timedatectl set-timezone 'Africa/Nairobi' 
timedatectl 
apt update && apt upgrade -y # To get & install the latest package lists 
apt install -y htop glances whowatch arpwatch dsniff net-tools nload bmon vnstat iftop ifstat deborphan usbguard nmap pwgen acct traceroute clamav clamav-daemon sysstat fail2ban libpam-pwquality libpam-passwdqc apt-show-versions auditd debsums cockpit cockpit-pcp finger chkrootkit ifplugd rsync bat fd-find ncdu pv tldr tree 
apt autoclean && apt autoremove -y && apt clean # Clearing disk space 
chmod 600 /etc/crontab && chmod 700 /etc/cron.d && chmod 700 /etc/cron.daily && chmod 700 /etc/cron.hourly && chmod 700 /etc/cron.weekly && chmod 700 /etc/cron.monthly && chmod 600 /etc/ssh/sshd_config && chmod 600 /boot/grub/grub.cfg # Configuring file permissions 
chmod 750 /etc/sudoers.d # Configuring folder permissions 
systemctl stop clamav-freshclam.service # Configuring ClamAV 
freshclam 
systemctl enable --now clamav-freshclam.service 
systemctl start clamav-daemon.service 
echo "*     soft     core     0" >> /etc/security/limits.conf # Disabling of Core Dumps 
echo "*     hard     core     0" >> /etc/security/limits.conf 
sed -i "s/PASS_MAX_DAYS\t99999/PASS_MAX_DAYS\t30/" /etc/login.defs # Configure maximum password age 
sed -i "s/PASS_MIN_DAYS\t0/PASS_MIN_DAYS\t7/" /etc/login.defs # Configure minimum password age 
sed -i "s/UMASK\t\t022/UMASK\t\t027/" /etc/login.defs # Changing default umask in /etc/login.defs
echo "install dccp /bin/true" >> /etc/modprobe.d/dccp.conf # Disabling DCCP 
echo "install rds /bin/true" >> /etc/modprobe.d/rds.conf # Disabling RDS 
echo "install sctp /bin/true" >> /etc/modprobe.d/sctp.conf # Disabling SCTP 
echo "install tipc /bin/true" >> /etc/modprobe.d/tipc.conf # Disabling TIPC 
echo "install usb-storage /bin/true" >> /etc/modprobe.d/usb-storage.conf # Disabling USB 
sed -ie 's/^\s*#AddressFamily any/AddressFamily inet/' /etc/ssh/sshd_config # Hardening SSH 
sed -ie 's/^\s*#LogLevel INFO/LogLevel VERBOSE/' /etc/ssh/sshd_config 
sed -ie 's/^\s*#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config 
sed -ie 's/^\s*#MaxAuthTries 6/MaxAuthTries 3/' /etc/ssh/sshd_config 
sed -ie 's/^\s*#MaxSessions 10/MaxSessions 2/' /etc/ssh/sshd_config 
sed -ie 's/^\s*#PermitEmptyPasswords no/PermitEmptyPasswords no/' /etc/ssh/sshd_config 
sed -ie 's/^\s*#AllowAgentForwarding yes/AllowAgentForwarding no/' /etc/ssh/sshd_config 
sed -ie 's/^\s*#AllowTcpForwarding yes/AllowTcpForwarding no/' /etc/ssh/sshd_config 
sed -i "s/X11Forwarding yes/X11Forwarding no/" /etc/ssh/sshd_config 
sed -ie 's/^\s*#TCPKeepAlive yes/TCPKeepAlive no/' /etc/ssh/sshd_config 
sed -ie 's/^\s*#ClientAliveCountMax 3/ClientAliveCountMax 2/' /etc/ssh/sshd_config 
systemctl restart ssh 
sed -i "s/IPV6=yes/IPV6=no/" /etc/default/ufw #Configuring ufw 
ufw enable 
ufw allow 22/tcp 
ufw allow 9090/tcp 
ufw status verbose 
sed -i 's/ENABLED="false"/ENABLED="true"/' /etc/default/sysstat # Enable sysstat 
sed -ie 's/^\s*kernel.sysrq = 176/kernel.sysrq = 0/' /etc/sysctl.d/10-magic-sysrq.conf # Kernel Hardening 
sed -ie 's/^\s*kernel.kptr_restrict = 1/kernel.kptr_restrict = 2/' /etc/sysctl.d/10-kernel-hardening.conf 
sed -ie 's/^\s*#net.ipv4.conf.default.rp_filter=1/net.ipv4.conf.default.rp_filter=1/' /etc/sysctl.d/99-sysctl.conf 
sed -ie 's/^\s*#net.ipv4.conf.all.rp_filter=1/net.ipv4.conf.all.rp_filter=1/' /etc/sysctl.d/99-sysctl.conf 
sed -ie 's/^\s*#net.ipv4.ip_forward=1/net.ipv4.ip_forward=0/' /etc/sysctl.d/99-sysctl.conf 
sed -ie 's/^\s*#net.ipv4.conf.all.accept_redirects = 0/net.ipv4.conf.all.accept_redirects = 0/' /etc/sysctl.d/99-sysctl.conf 
sed -ie 's/^\s*#net.ipv4.conf.default.accept_redirects = 0/net.ipv4.conf.default.accept_redirects = 0/' /etc/sysctl.d/99-sysctl.conf 
sed -ie 's/^\s*#net.ipv4.conf.all.secure_redirects = 0/net.ipv4.conf.all.secure_redirects = 0/' /etc/sysctl.d/99-sysctl.conf 
sed -ie 's/^\s*#net.ipv4.conf.default.secure_redirects = 0/net.ipv4.conf.default.secure_redirects = 0/' /etc/sysctl.d/99-sysctl.conf 
sed -ie 's/^\s*#net.ipv4.conf.all.send_redirects = 0/net.ipv4.conf.all.send_redirects = 0/' /etc/sysctl.d/99-sysctl.conf 
sed -ie 's/^\s*#net.ipv4.conf.all.accept_source_route = 0/net.ipv4.conf.all.accept_source_route = 0/' /etc/sysctl.d/99-sysctl.conf 
sed -ie 's/^\s*#net.ipv4.conf.default.accept_source_route = 0/net.ipv4.conf.default.accept_source_route = 0/' /etc/sysctl.d/99-sysctl.conf 
sed -ie 's/^\s*#net.ipv4.conf.all.log_martians = 1/net.ipv4.conf.all.log_martians = 1/' /etc/sysctl.d/99-sysctl.conf 
sysctl -p /etc/sysctl.d/10-kernel-hardening.conf 
sysctl -p /etc/sysctl.d/10-magic-sysrq.conf 
sysctl -p /etc/sysctl.d/99-sysctl.conf 
wget https://dystroy.org/dysk/download/x86_64-linux/dysk # Configuring Dysk 
mv dysk /usr/local/bin/ 
chmod +x /usr/local/bin/dysk
dysk -a 
echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | sudo tee /etc/apt/sources.list.d/cisofy-lynis.list # Add Lynis repository 
wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key | sudo apt-key add - # Dwnload Lynis public signing key 
apt update # Refreshing the system repository 
apt install -y lynis 
lynis audit system # Run security auditing tool 
# end of script 