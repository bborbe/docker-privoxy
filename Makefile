VERSION ?= latest
REGISTRY ?= docker.io

default: build

clean:
	docker rmi $(REGISTRY)/bborbe/privoxy:$(VERSION)

build:
	docker build --build-arg VERSION=$(VERSION) --no-cache --rm=true -t $(REGISTRY)/bborbe/privoxy:$(VERSION) .

run:
	docker run \
	-p 8118:8118 \
	$(REGISTRY)/bborbe/privoxy:$(VERSION)

shell:
	docker run -i -t $(REGISTRY)/bborbe/privoxy:$(VERSION) /bin/bash

upload:
	docker push $(REGISTRY)/bborbe/privoxy:$(VERSION)





