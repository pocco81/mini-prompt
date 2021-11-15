SHELL:=/usr/bin/env bash

PREFIX=$(HOME)/.local/bin
BASHRC=$(HOME)/.bashrc
LOG_INFO=$(shell date +"%H:%M:%S") \e[0;34mINFO\e[0m
LOG_ERROR=$(shell date +"%H:%M:%S") \e[1;31mERROR\e[0m
LOG_WARNING=$(shell date +"%H:%M:%S") \e[0;33mWARNING\e[0m
LOG_SUCCESS=$(shell date +"%H:%M:%S") \e[0;32mSUCCESS\e[0m

.DEFAULT_GOAL := install
INSTALLATION_MEDIUM=any

install:
	@./scripts/install.sh $(CURDIR) $(PREFIX) $(INSTALLATION_MEDIUM) $(BASHRC)

uninstall:
	@./scripts/uninstall.sh $(PREFIX) $(INSTALLATION_MEDIUM)

run:
	@echo -e "$(LOG_INFO) Running MiniPrompt...\n"
	./miniprompt

publish:
	@echo -e "$(LOG_INFO) Publishing to NPM..."
	@npm publish

