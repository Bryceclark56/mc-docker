FROM adoptopenjdk/openjdk15-openj9:alpine-jre

ENV EULA=false
ENV USEFABRIC=false

EXPOSE 25565/tcp

# Move required files
COPY [".", "/mc-server"]
RUN ["chmod", "+x", "-R", "mc-server/scripts"]
RUN ["mkdir", "mc-server/server"]

# Install required packages
RUN apk add --no-cache \
    jq curl wget

# Start server
CMD cd /mc-server/server && ../scripts/startup.sh