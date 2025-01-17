#!/bin/bash 
apt update && apt upgrade -y # To get & install the latest package lists 
apt autoclean && apt autoremove -y && apt clean # Clearing disk space 
# end of script 