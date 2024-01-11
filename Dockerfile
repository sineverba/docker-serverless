ARG NODE_VERSION=20.10.0
FROM --platform=$BUILDPLATFORM node:$NODE_VERSION-alpine3.19
# Set versions from Make, otherwise use default
## NPM
ARG NPM_VERSION=latest
ENV NPM_VERSION $NPM_VERSION
## SERVERLESS
ARG SERVERLESS_VERSION=latest
ENV SERVERLESS_VERSION $SERVERLESS_VERSION
# Update and upgrade
RUN apk update && \
    apk upgrade --available --no-cache && \
    rm -rf /var/cache/apk/*
# Install
RUN npm install -g npm@$NPM_VERSION && npm install -g serverless@$SERVERLESS_VERSION
# Set workdir
WORKDIR /app
