ARG NODE_VERSION=18.15.0
FROM node:$NODE_VERSION-alpine3.17
# Set versions from Make, otherwise use default
## NPM
ARG NPM_VERSION=latest
ENV NPM_VERSION $NPM_VERSION
## SERVERLESS
ARG SERVERLESS_VERSION=latest
ENV SERVERLESS_VERSION $SERVERLESS_VERSION
# Update and upgrade
RUN apk update --no-cache && apk upgrade
# Install
RUN npm install -g npm@$NPM_VERSION && npm install -g serverless@$SERVERLESS_VERSION
# Set workdir
WORKDIR /app
