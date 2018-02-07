build:  ## Build docker image
	docker build -t dyploma-demo .

run:  ## Run project inside docker container
	docker run -it --entrypoint=python -p 8080:8080 dyploma-demo src/main.py

check:  ## Do some requests to exposed endpoints
	@echo "Request homepage"
	curl http://localhost:8080/

	@echo "Request selftest"
	curl http://localhost:8080/selftest

	@echo "Request metrics"
	curl http://localhost:8080/metrics


#### Support for help/self-documenting feature
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: help

.DEFAULT_GOAL := help
