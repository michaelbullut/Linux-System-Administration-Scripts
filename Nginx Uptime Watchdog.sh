#!/bin/bash   

SERVICE_NAME="nginx" # The name of the web server service 
SERVICE_CMD="/etc/init.d/nginx" # The command we use to control nginx 

# Checking if the service is running or not
if ! pgrep -x "$SERVICE_NAME" > /dev/null; then
        $SERVICE_CMD restart
        echo "$SERVICE_NAME was down and has been restarted"
fi

# end of script 