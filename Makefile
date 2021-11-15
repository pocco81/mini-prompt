SHELL:=/usr/bin/env bash

PREFIX=$(HOME)/.local
CONFIG_DIR=$(HOME)/.config/miniprompt
BASHRC=$(HOME)/.bashrc
LOG_INFO=$(shell date +"%H:%M:%S") \e[0;34mINFO\e[0m
LOG_ERROR=$(shell date +"%H:%M:%S") \e[1;31mERROR\e[0m
LOG_WARNING=$(shell date +"%H:%M:%S") \e[0;33mWARNING\e[0m
LOG_SUCCESS=$(shell date +"%H:%M:%S") \e[0;32mSUCCESS\e[0m

.DEFAULT_GOAL := install
INSTALLATION_MEDIUM=any

install:
	@echo -e "$(LOG_INFO) Preparing..."
	@mkdir -p $(CONFIG_DIR)
	@echo -e "$(LOG_INFO) Installing MiniPrompt under $(PREFIX)/bin/..."
	@if [[ ! "$(INSTALLATION_MEDIUM)" == "npm" ]]; then \
		echo "ran"; \
		install $(CURDIR)/miniprompt $(PREFIX)/bin/miniprompt; \
	else \
		PREFIX=/usr; \
	fi
	@echo -e "$(LOG_INFO) Cloning default config under $(CONFIG_DIR)..."
	@cp $(CURDIR)/config/conf.toml $(CONFIG_DIR)/conf.toml
	@if ! grep -q $(PREFIX)/bin/miniprompt "$(BASHRC)"; then \
		echo -e "$(LOG_WARNING) Appending sourcing command to your $(BASHRC)..."; \
		echo -e "alias mp=\"source $(PREFIX)/bin/miniprompt\"\nmp" >> $(BASHRC); \
	fi
	@echo -e "$(LOG_SUCCESS) You are all set, just reload your shell!"

uninstall:
	@echo -e "$(LOG_INFO) Preparing..."
	@if [[ -f "$(PREFIX)/bin/miniprompt" ]]; then \
		rm "$(PREFIX)/bin/miniprompt"; \
		echo -e "$(LOG_SUCCESS) uninstalled successfully"; \
	else \
		echo -e "$(LOG_ERROR) MiniPrompt is not installed/was not found"; \
	fi

run:
	@echo -e "$(LOG_INFO) Running MiniPrompt...\n"
	./miniprompt

publish:
	@echo -e "$(LOG_INFO) Publishing to NPM..."
	@npm publish

