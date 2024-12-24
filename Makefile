
FLUTTER?=fvm flutter
DART?=fvm dart
REPOSITORIES?=lib/ test/
RUN_VERSION?=--debug

GREEN_COLOR=\033[32m
NO_COLOR=\033[0m

define print_color_message
	@echo "$(GREEN_COLOR)$(1)$(NO_COLOR)";
endef

##
## ---------------------------------------------------------------
## Installation
## ---------------------------------------------------------------
##

.PHONY: install
install: ## Install environment
	@$(call print_color_message,"Install environment")
	fvm install

##
## ---------------------------------------------------------------
## Flutter
## ---------------------------------------------------------------
##

.PHONY: clean
clean: ## Clear cache
	@$(call print_color_message,"Clear cache")
	$(FLUTTER) clean

.PHONY: dependencies
dependencies: ## Update dependencies
	@$(call print_color_message,"Update dependencies")
	$(FLUTTER) pub get

.PHONY: format
format: ## Format code by default lib directory
	@$(call print_color_message,"Format code by default lib directory")
	$(DART) format $(REPOSITORIES)

.PHONY: analyze
analyze: ## Analyze Dart code of the project
	@$(call print_color_message,"Analyze Dart code of the project")
	$(FLUTTER) analyze .

.PHONY: format-analyze
format-analyze: format analyze ## Format & Analyze Dart code of the project

.PHONY: test
test: ## Run all tests with coverage
	@$(call print_color_message,"Run all tests with coverage")
	$(FLUTTER) test \
		--coverage \
		--test-randomize-ordering-seed random \
		--reporter expanded
	genhtml coverage/lcov.info \
		--output-directory coverage/html
	open coverage/html/index.html

.PHONY: integration-test
integration-test: ## Run all integration tests
	@$(call print_color_message,"Run all integration tests")
	$(FLUTTER) test \
		integration_test/

.PHONY: run
run: ## Run application by default debug version
	@$(call print_color_message,"Run application by default debug version")
	$(FLUTTER) run \
		$(RUN_VERSION)

##
## ---------------------------------------------------------------
## Maestro
## ---------------------------------------------------------------
##

.PHONY: maestro-studio
maestro-studio: ## Run Maestro Studio
	@$(call print_color_message,"Run Maestro Studio")
	maestro studio

.PHONY: maestro-hierarchy
maestro-hierarchy: ## Show hierarchy with Maestro
	@$(call print_color_message,"Show hierarchy with Maestro")
	maestro hierarchy

.PHONY: maestro-test
maestro-test: ## Run Maestro test
	@$(call print_color_message,"Run Maestro test")
	maestro test maestro/flow.yaml \
		--format=junit \
		--output=maestro/results.xml

##
## ---------------------------------------------------------------
## scrcpy
## ---------------------------------------------------------------
##

.PHONY: mirror
mirror: ## Mirror screen with scrcpy
	@$(call print_color_message,"Mirror screen with scrcpy")
	scrcpy --max-size 1024 --window-title 'My device'

.PHONY: record
record: ## Record screen with scrcpy
	@$(call print_color_message,"Record screen with scrcpy")
	scrcpy --max-size 1024 --no-display --record "flutter_$(shell date +%Y%m%d-%H%M%S).mp4"

#
# ----------------------------------------------------------------
# Help
# ----------------------------------------------------------------
#

.DEFAULT_GOAL := help
.PHONY: help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "$(GREEN_COLOR)%-30s$(NO_COLOR) %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
