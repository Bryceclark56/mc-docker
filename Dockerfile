FROM adoptopenjdk/openjdk15-openj9:alpine-jre
ENV VERSION="latest"
ARG EULA="false"

# Install required packages
RUN apk add --no-cache \
    --virtual getjar-deps \
    --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    jq

# Move required files
COPY ./getjar.sh ./getjar.sh

# Get server.jar indicated by VERSION
RUN ./getjar.sh $VERSION

# Start server
CMD ["java", "-Dcom.mojang.eula.agree=${EULA}", "minecraft_server-X.Y.Z.jar"]