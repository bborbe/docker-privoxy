REGISTRY ?= docker.io
ifeq ($(VERSION),)
	VERSION = $(shell git fetch --tags; git describe --tags `git rev-list --tags --max-count=1`)
endif

default: build

clean:
	docker rmi $(REGISTRY)/bborbe/privoxy:$(VERSION)

build:
	docker build --no-cache --rm=true -t $(REGISTRY)/bborbe/privoxy:$(VERSION) .

run:
	docker run \
	-p 8118:8118 \
	$(REGISTRY)/bborbe/privoxy:$(VERSION)

shell:
	docker run -i -t $(REGISTRY)/bborbe/privoxy:$(VERSION) /bin/bash

upload:
	docker push $(REGISTRY)/bborbe/privoxy:$(VERSION)





