#!/bin/bash   

SERVICE_NAME="postgresql" # The name of the database service 
SERVICE_CMD="/etc/init.d/postgresql" # The command we use to control postgresql 

# Checking if the service is running or not
if ! pgrep -x "$SERVICE_NAME" > /dev/null; then
        $SERVICE_CMD restart
        echo "$SERVICE_NAME was down and has been restarted"
fi

# end of script 