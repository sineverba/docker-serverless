Docker Serverless
=================

> Docker image to use Serverless Framework without installing it

| CD / CI   | Status |
| --------- | ------ |
| Semaphore CI | [![Build Status](https://sineverba.semaphoreci.com/badges/docker-serverless/branches/master.svg?style=shields&key=bd338b60-d353-4360-9911-4b81d6574423)](https://sineverba.semaphoreci.com/projects/docker-serverless) |


## Usage

`$ docker run --rm -it sineverba/serverless:1.0.0 -v [YOUR_VOLUME]:app/ serverless [COMMAND]`


## Usage in .bashrc

`alias serverless='docker run -it -v ${PWD}:/app --entrypoint serverless --rm sineverba/serverless:1.0.0'`


## Github / image tags and versions

| Github / Docker Image tag | Node Version | NPM Version | Serverless version | Architecture |
| ------------------------- | ------------ | ----------- | ------------------ | ------------ |
| latest | 18.17.0 | 9.8.1 | 3.33.0 | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.0.0 | 18.15.0 | 9.6.2 | 3.28.1 | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |