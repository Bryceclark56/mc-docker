#!/bin/sh
# Assumes the script is run in servers/ directory

# Get server jar
../scripts/getjar.sh

# Set EULA
echo "EULA="$EULA > eula.txt