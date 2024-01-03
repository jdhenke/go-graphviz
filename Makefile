CONTAINER_NAME := graphviz-wasm
IMAGE_NAME := graphviz-wasm

wasm/generate: container/run
	$(eval CONTAINER_ID := $(shell make container/id))
	docker cp "$(CONTAINER_ID):/work/graphviz.wasm" ./internal/wasm/graphviz.wasm
	docker kill $(CONTAINER_ID)

container/run: container/build
	docker run --name $(CONTAINER_NAME) -d -it $(IMAGE_NAME) bash

container/id:
	@docker ps --filter name=$(CONATINER_NAME) --format "{{.ID}}"

container/build:
	docker build ./internal/wasm/build -t $(IMAGE_NAME)

container/clean:
	$(eval CONTAINER_ID := $(shell make container/id))
	docker kill $(CONTAINER_ID)

container/prune:
	docker container prune
