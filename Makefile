IMAGE_NAME=sineverba/serverless
CONTAINER_NAME=serverless
APP_VERSION=1.1.0-dev
NODE_VERSION=18.17.0
NPM_VERSION=9.8.1
SERVERLESS_VERSION=3.33.0
BUILDX_VERSION=0.11.2
BINFMT_VERSION=qemu-v7.0.0-28

build:
	docker build \
		--build-arg NODE_VERSION=$(NODE_VERSION) \
		--build-arg NPM_VERSION=$(NPM_VERSION) \
		--build-arg SERVERLESS_VERSION=$(SERVERLESS_VERSION) \
		--tag $(IMAGE_NAME):$(APP_VERSION) \
		"."

preparemulti:
	mkdir -vp ~/.docker/cli-plugins
	curl \
		-L \
		"https://github.com/docker/buildx/releases/download/v$(BUILDX_VERSION)/buildx-v$(BUILDX_VERSION).linux-amd64" \
		> \
		~/.docker/cli-plugins/docker-buildx
	chmod a+x ~/.docker/cli-plugins/docker-buildx
	docker buildx version
	docker run --rm --privileged tonistiigi/binfmt:$(BINFMT_VERSION) --install all
	docker buildx ls
	docker buildx rm multiarch
	docker buildx create --name multiarch --driver docker-container --use
	docker buildx inspect --bootstrap --builder multiarch

multi: preparemulti
	docker buildx build \
		--platform linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 \
		--tag $(IMAGE_NAME):$(APP_VERSION) \
		"."

test:
	docker run --rm -it $(IMAGE_NAME):$(APP_VERSION) cat /etc/os-release | grep "Alpine Linux v3.18"
	docker run --rm -it $(IMAGE_NAME):$(APP_VERSION) cat /etc/os-release | grep "VERSION_ID=3.18.2"
	docker run --rm -it $(IMAGE_NAME):$(APP_VERSION) node -v | grep $(NODE_VERSION)
	docker run --rm -it $(IMAGE_NAME):$(APP_VERSION) npm -v | grep $(NPM_VERSION)
	docker run --rm -it $(IMAGE_NAME):$(APP_VERSION) serverless -v | grep $(SERVERLESS_VERSION)

screate:
	docker run \
		--rm \
		-it \
		-v $(PWD)/testtemplate:/app \
		$(IMAGE_NAME):$(APP_VERSION) \
		serverless create --template aws-nodejs-typescript --path aws-serverless-typescript-api

destroy:
	-docker image rm node:$(NODE_VERSION)-alpine3.18
	-docker image rm $(IMAGE_NAME):$(APP_VERSION)