#!/bin/sh
echo "Retrieving version number..."
VERSION=$(<.version)
echo "Found version $VERSION"

echo "Starting server..."
java "minecraft_server-$VERSION.jar"