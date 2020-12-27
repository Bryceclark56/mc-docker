#!/bin/sh
echo "Retrieving version number..."
VERSION=$(cat .version)
echo "Found version $VERSION"

echo "Starting server..."
java -jar "minecraft_server-$VERSION.jar"