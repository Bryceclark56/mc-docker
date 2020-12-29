#!/bin/sh
# Obtains the latest build of Fabric installer and creates the server with it
echo "Attempting to retrieve latest Fabric installer..."

JENKINS_URL="https://jenkins.modmuss50.me/job/FabricMC/job/fabric-installer/job/master/api/json"

echo "Querying Fabric Jenkins server"
JENKINS_JSON="$(curl -sSf "$JENKINS_URL")"

echo "Getting latest stable build"
LAST_STABLE_URL=$(echo $JENKINS_JSON | jq -r .lastStableBuild.url)
LAST_STABLE_JSON="$(curl -sSf $LAST_STABLE_URL"api/json/")"
echo "Found build #"$(echo $LAST_STABLE_JSON | jq -r .number)" from $(date -d "@$(($(echo $LAST_STABLE_JSON | jq -r .timestamp) / 1000))")"


echo "Attempting to download JAR file: $(echo $LAST_STABLE_JSON | jq -r .artifacts[0].fileName) > fabric-installer.jar"
curl -# -o "fabric-installer.jar" "${LAST_STABLE_URL}artifact/$(echo $LAST_STABLE_JSON | jq -r .artifacts[0].relativePath)"

echo "Running fabric installer"
java -jar fabric-installer.jar server -downloadMinecraft