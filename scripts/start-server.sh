#!/bin/sh
# echo "Retrieving version number..."
# VERSION=$(cat .version)
# echo "Found version $VERSION"

# Optimizations for Java OpenJ9 taken from https://steinborn.me/posts/tuning-minecraft-openj9/

echo "Starting server..."
SERVER_JAR="server.jar"
if [ "$USEFABRIC" = true ]; then
    echo "Using fabric launcher..."
    SERVER_JAR="fabric-server-launch.jar"
fi

NURSERY_MIN=$(($HEAP_SIZE / 2))
NURSERY_MAX=$(($HEAP_SIZE * 4 / 5))

CMD="java -Xms${HEAP_SIZE}M -Xmx${HEAP_SIZE}M -Xmns${NURSERY_MIN}M -Xmnx${NURSERY_MAX}M -Xgc:concurrentScavenge -Xgc:dnssExpectedTimeRatioMaximum=3 -Xtune:virtualized -Xgc:scvNoAdaptiveTenure -Xdisableexplicitgc -jar ${SERVER_JAR}"
echo "Starting with command: ${CMD}"
${CMD}