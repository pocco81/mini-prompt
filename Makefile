SHELL:=/usr/bin/env bash

PREFIX=/tmp/home_test/.local
CONFIG_DIR=/tmp/home_test/.config
BASHRC=/tmp/home_test/.bashrc
LOG_INFO=$(shell date +"%H:%M:%S") \e[0;34mINFO\e[0m
LOG_ERROR=$(shell date +"%H:%M:%S") \e[1;31mERROR\e[0m
LOG_WARNING=$(shell date +"%H:%M:%S") \e[0;33mWARNING\e[0m
LOG_SUCCESS=$(shell date +"%H:%M:%S") \e[0;32mSUCCESS\e[0m

.DEFAULT_GOAL := install

install:
	@echo -e "$(LOG_INFO) Preparing..."
	@mkdir -p $(PREFIX)/bin $(CONFIG_DIR)/smt
	@echo -e "$(LOG_INFO) Installing MiniPrompt under $(PREFIX)/bin/..."
	@install $(CURDIR)/simple_mnp_test.sh $(PREFIX)/bin/smt
	@echo -e "$(LOG_INFO) Cloning default config under $(CONFIG_DIR)/smt/..."
	@cp $(CURDIR)/config/sample.toml $(CONFIG_DIR)/smt/sample.toml
	@if ! grep -q .local/bin/smt "$(BASHRC)"; then \
		echo -e "$(LOG_WARNING) Appending sourcing command to your $(BASHRC)..."; \
		echo -e "alias mp=\"$(PREFIX)/bin/smt\"\nmp" >> $(BASHRC); \
	fi
	@echo -e "$(LOG_SUCCESS) You are all set!"

uninstall:
	@echo -e "$(LOG_INFO) Preparing..."
	@if [[ -f "$(PREFIX)/bin/smt" ]]; then \
		rm "$(PREFIX)/bin/smt"; \
		echo -e "$(LOG_SUCCESS) uninstalled successfully"; \
	else \
		echo -e "$(LOG_ERROR) MiniPrompt is not installed/was not found"; \
	fi

run:
	@echo -e "$(LOG_INFO) Running MiniPrompt...\n"
	./simple_mnp_test.sh

