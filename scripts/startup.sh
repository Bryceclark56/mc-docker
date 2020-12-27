# Ensure running in server/ directory
CURRENT_FOLDER=${PWD##*/}
if [ $CURRENT_FOLDER != "server" ]; then
    if [ $CURRENT_FOLDER = "scripts" ]; then
        cd ../server/
    else
        cd ./server/
    fi
fi

# Check if first startup
#   Launch setup.sh if true
[ ! -e minecraft_server-*.jar ] && ../scripts/setup.sh

# Launch server
../scripts/start-server.sh