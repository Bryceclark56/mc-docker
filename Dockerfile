FROM adoptopenjdk/openjdk15-openj9:alpine-jre

EXPOSE 25565/tcp

# Move required files
COPY . mc-server/
RUN ["chmod", "+x", "-R", "mc-server/scripts"]

# Install required packages
RUN apk add --no-cache \
    jq curl wget

# Start server
CMD ["./scripts/startup.sh"]