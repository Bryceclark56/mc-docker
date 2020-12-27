#!/bin/sh
# Assumes the script is run in servers/ directory
echo "Running first-time setup..."

# Get server jar
../scripts/getjar.sh

# Set EULA
echo "Setting EULA to $EULA"
echo "EULA=$EULA" > eula.txt

echo "First-time setup finished"