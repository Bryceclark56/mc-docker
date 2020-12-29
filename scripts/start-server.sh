#!/bin/sh
# echo "Retrieving version number..."
# VERSION=$(cat .version)
# echo "Found version $VERSION"

echo "Starting server..."
SERVER_JAR="server.jar"
if [ "$USEFABRIC" = true ]; then
    echo "Using fabric..."
    SERVER_JAR="fabric-server-launch.jar"
fi

java -jar $SERVER_JAR