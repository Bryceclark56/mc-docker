FROM adoptopenjdk/openjdk15-openj9:alpine-jre
ENV VERSION="latest"
ARG EULA="false"

# Install required packages
RUN apk add --no-cache \
    jq curl wget

# Move required files
COPY ./scripts/ ./scripts/

# Start server
CMD ["./scripts/startup.sh"]