NAME = michalhosna/nginx-rtmp
ALPINE_VERSION=3.12
NGINX_VERSION=1.18
FFMPEG_VERSION=4.3
TAG = 1_alpine$(ALPINE_VERSION)_ffmpeg$(FFMPEG_VERSION)_nginx$(NGINX_VERSION)

all: build publish publish-latest

build:
	docker build -t $(NAME):$(TAG) \
		--build-arg ALPINE_VERSION="$(ALPINE_VERSION)" \
		--build-arg NGINX_VERSION="$(NGINX_VERSION)" \
		--build-arg FFMPEG_VERSION="$(FFMPEG_VERSION)" \
		.

publish:
	docker push $(NAME):$(TAG)

publish-latest:
	docker tag $(NAME):$(TAG) $(NAME):latest
	docker push $(NAME):latest

.PHONY: publish publish-latest all build
