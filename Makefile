SHELL:=/usr/bin/env bash

PREFIX=$(HOME)/.local/bin
CONFIG_DIR=$(HOME)/.config/miniprompt
BASHRC=$(HOME)/.bashrc
LOG_INFO=$(shell date +"%H:%M:%S") \e[0;34mINFO\e[0m
LOG_ERROR=$(shell date +"%H:%M:%S") \e[1;31mERROR\e[0m
LOG_WARNING=$(shell date +"%H:%M:%S") \e[0;33mWARNING\e[0m
LOG_SUCCESS=$(shell date +"%H:%M:%S") \e[0;32mSUCCESS\e[0m

.DEFAULT_GOAL := install
INSTALLATION_MEDIUM=any

install:
	$(eval LOCAL_PREFIX="$(PREFIX)")
	@echo -e "$(LOG_INFO) Preparing..."
	@mkdir -p $(CONFIG_DIR)
	@echo -e "$(LOG_INFO) Installing MiniPrompt under $(LOCAL_PREFIX)/..."
	@if [[ ! "$(INSTALLATION_MEDIUM)" == "npm" ]]; then \
		install $(CURDIR)/miniprompt $(LOCAL_PREFIX)/miniprompt; \
	else \
		echo "GOT HERE ------->"; \
		$(eval LOCAL_PREFIX="/usr/bin") \
	fi
	@echo -e "$(LOG_INFO) Cloning default config under $(CONFIG_DIR)..."
	@cp $(CURDIR)/config/conf.toml $(CONFIG_DIR)/conf.toml
	@if ! grep -q $(LOCAL_PREFIX)/miniprompt "$(BASHRC)"; then \
		echo -e "$(LOG_WARNING) Appending sourcing command to your $(BASHRC)..."; \
		echo -e "alias mp=\"source $(LOCAL_PREFIX)/miniprompt\"\nmp" >> $(BASHRC); \
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

