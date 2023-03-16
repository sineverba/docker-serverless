Docker Serverless
=================

> Docker image to use Serverless Framework without installing it

| CD / CI   | Status |
| --------- | ------ |
| Semaphore CI | TBD |


## Usage

`$ docker run --rm -it sineverba/serverless:0.1.0 -v [YOUR_VOLUME]:app/ serverless [COMMAND]`


## Usage in .bashrc

`alias serverless='docker run -it sineverba/serverless:0.1.0 -v ${PWD}:/app serverless`


## Github / image tags and versions

| Github / Docker Image tag | Node Version | NPM Version | Serverless version | Architecture |
| ------------------------- | ------------ | ----------- | ------------------ | ------------ |
| next | 18.15.0 | 9.6.2 | 3.28.1 | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |