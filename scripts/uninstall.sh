#!/bin/bash

LOG_INFO="$(date +"%H:%M:%S") \e[0;34mINFO\e[0m"
LOG_ERROR="$(date +"%H:%M:%S") \e[1;31mERROR\e[0m"
LOG_WARNING="$(date +"%H:%M:%S") \e[0;33mWARNING\e[0m"
LOG_SUCCESS="$(date +"%H:%M:%S") \e[0;32mSUCCESS\e[0m"

PREFIX=$1
INSTALLATION_MEDIUM=$2


echo -e "${LOG_INFO} Analyzing..."

if [[ "${INSTALLATION_MEDIUM}" == "npm" ]]; then
	PREFIX="${CURDIR}"
fi

if [[ -f "${PREFIX}/miniprompt" ]]; then
	rm "${PREFIX}/miniprompt"
	echo -e "${LOG_SUCCESS} Successfully uninstalled MiniPrompt!"
else
	echo -e "${LOG_ERROR} MiniPrompt is not installed/was not found"
fi

