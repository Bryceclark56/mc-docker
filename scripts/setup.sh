#!/bin/sh
# Assumes the script is run in servers/ directory
echo "Running first-time setup..."

# Get server jar
../scripts/getjar.sh

# Set EULA
EULA=${EULA:-false}
echo "Setting EULA to $EULA"
echo "eula=$EULA" > eula.txt

echo "First-time setup finished"