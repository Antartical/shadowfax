#!make
.DEFAULT_GOAL=start

local.build:
	@docker-compose build

local.start:
	@docker-compose up -d

local.down:
	@docker-compose down

local.test:
	@docker exec -it shadowfax npm test -- --watchAll=false

local.coverage:
	@docker exec -it shadowfax npm run test:coverage

local.check.credentials:
	@if ! [ -s ~/.credentials/ghcr.name ]; then \
    	python3 build/scripts/ghcr.py; \
    fi

local.docker.login: local.check.credentials
	@cat ~/.credentials/ghcr.token | docker login ghcr.io -u $(shell cat ~/.credentials/ghcr.name) --password-stdin

logs:
	@docker logs -f $(shell docker-compose ps -q shadowfax)

sh:
	@docker exec -it shadowfax /bin/bash

docker_tag_and_push: ci.docker.login
	@export TAG=$(date +%d%m%Y-%H%M%S)
	@docker build -f build/docker/dockerfile.prod -t $(REGISTRY):latest -t $(REGISTRY):$(TAG) .
	@docker push $(REGISTRY):$(TAG)
	@docker push $(REGISTRY):latest

start: local.docker.login local.start

stop: local.down

renew: local.down local.build local.start

.PHONY:  start stop sh logs renew coverage_report ci_check_tests docker_tag_and_push
