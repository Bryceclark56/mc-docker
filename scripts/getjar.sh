#!/bin/sh
### # # # # # # # # # # # # # # # # # # # # # # # # # # # ###
# Ensures server .jar exists and is of the correct version. #
#  If it does not exists, downloads it.                     #
#                                                           #
# Accepts an optional single argument consisting of         #
#  a Minecraft version string.                              #
### # # # # # # # # # # # # # # # # # # # # # # # # # # # ###

MANIFEST_URL="https://launchermeta.mojang.com/mc/game/version_manifest.json"

echo "Retrieving version manifest from Mojang"
VERSION_MANIFEST=$(curl -sSf "$MANIFEST_URL")

# If arg1="latest" or empty, get latest release from manifest
VERSION=${1:-latest}
if [ "$VERSION" = "latest" ]; then
    echo "Checking for latest version"
    VERSION=$(echo "$VERSION_MANIFEST" | jq -r .latest.release)
fi

echo "Using Minecraft version $VERSION"

echo "Checking for existing server JAR file..."
if [ -e "minecraft_server-"$VERSION".jar" ]; then
    echo "Server JAR for "$VERSION" already exists"
    exit 0
fi

echo "Searching for further information on version $VERSION"
# Get url for further information on selected version
VERSION_URL=$(echo "$VERSION_MANIFEST" | jq -r ".versions[] | select(.id == \""$VERSION"\") | .url")

if [ -z "$VERSION_URL" ]; then
    echo "Unable to find version $VERSION in the version manifest"
    exit 1
fi

# Get server.jar url and grab the file
JAR_URL=$(curl -sSf "$VERSION_URL" | jq -r .downloads.server.url)
echo "Downloading JAR file from $JAR_URL"
curl -# -o "minecraft_server-$VERSION.jar" "$JAR_URL"
echo "Writing version to version.txt"
echo "$VERSION" > ".version"