#!/bin/bash 

SERVICE_NAME="haproxy" # The name of the load balancer service 
SERVICE_CMD="/etc/init.d/haproxy" # The command we use to control HAProxy 

# Checking if the service is running or not
if ! pgrep -x "$SERVICE_NAME" > /dev/null; then
        $SERVICE_CMD restart
        echo "$SERVICE_NAME was down and has been restarted"
fi

# end of script 
