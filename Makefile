# REGISTRY_PROJECT_URL ?= my-awesome-registry.org/my-cool-project
# BUILD_ID ?= commit_sha
# BUILD_ID ?=$(shell test -d .git && git rev-parse --short=8 HEAD)
# REF_ID = branch_name
# REF_ID ?=$(shell test -d .git && git symbolic-ref --short HEAD)

default: help
include makefiles/*.mk

.PHONY: start
start: docker-compose-build docker-compose-start ##- Start
.PHONY: deploy
deploy: docker-compose-build docker-compose-deploy ##- Deploy (start remotely)
.PHONY: stop
stop: docker-compose-stop ##- Stop

.PHONY: logs
logs: docker-compose-logs ##- Logs
