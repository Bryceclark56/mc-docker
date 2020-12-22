FROM adoptopenjdk/openjdk15-openj9:alpine-jre
ENV VERSION="latest"
ARG EULA="false"

# Install required packages

# Get latest version or use argument "VERSION"
RUN [ "./getjar.sh" "$VERSION"]

# Start server
CMD [ "java" "-Dcom.mojang.eula.agree=${EULA}" "minecraft_server-X.Y.Z.jar" ]