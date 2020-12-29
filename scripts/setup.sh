#!/bin/sh
# Assumes the script is run in servers/ directory
echo "Running first-time setup..."

# Get server files
if [ "$USEFABRIC" = true ]; then
    ../scripts/getfabric.sh
else
    ../scripts/getjar.sh
fi

# Set EULA
echo "Setting EULA to $EULA"
echo "eula=$EULA" > eula.txt

echo "First-time setup finished"