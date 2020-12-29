#!/bin/sh
# Ensure running in server/ directory
echo "Running startup script..."

CURRENT_FOLDER=${PWD##*/}
echo "Current directory is $PWD"
if [ "$CURRENT_FOLDER" != "server" ]; then
    echo "Startup is in the wrong directory; attempting to fix."
    cd /mc-server/server
fi

# Check if first startup
#   Launch setup.sh if true
[ ! -e "server.jar" ] && ../scripts/setup.sh

# Launch server
../scripts/start-server.sh