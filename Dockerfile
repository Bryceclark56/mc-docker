FROM adoptopenjdk/openjdk15-openj9:alpine-jre

ENV EULA=false
ENV USEFABRIC=false

EXPOSE 25565/tcp

VOLUME ["/mc-server/server"]

# Move required files
COPY [".", "/mc-server"]
RUN ["chmod", "+x", "-R", "/mc-server/scripts"]

# Install required packages
RUN apk add --no-cache \
    jq curl wget

# Start server
CMD /mc-server/scripts/startup.sh