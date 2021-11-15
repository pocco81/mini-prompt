#!/bin/bash

LOG_INFO="$(date +"%H:%M:%S") \e[0;34mINFO\e[0m"
LOG_ERROR="$(date +"%H:%M:%S") \e[1;31mERROR\e[0m"
LOG_WARNING="$(date +"%H:%M:%S") \e[0;33mWARNING\e[0m"
LOG_SUCCESS="$(date +"%H:%M:%S") \e[0;32mSUCCESS\e[0m"

CURDIR=$1
PREFIX=$2
INSTALLATION_MEDIUM=$3
BASHRC=$4
CONFIG_DIR=$5

echo -e "${LOG_INFO} Preparing..."

mkdir -p "${CONFIG_DIR}"
if [[ ! "${INSTALLATION_MEDIUM}" == "npm" ]]; then
	install "${CURDIR}/miniprompt" "${PREFIX}/miniprompt"
else
	PREFIX="${CURDIR}"
fi
echo -e "${LOG_INFO} Installing MiniPrompt under ${PREFIX}/..."
echo -e "${LOG_INFO} Cloning default config under ${CONFIG_DIR}..."
cp "${CURDIR}/config/conf.toml" "${CONFIG_DIR}/conf.toml"
if ! grep -q ${PREFIX}/miniprompt "${BASHRC}"; then \
	echo -e "${LOG_WARNING} Appending sourcing command to your ${BASHRC}..."; \
	echo -e "alias mp=\"source ${PREFIX}/miniprompt\"\nmp" >> "${BASHRC}"; \
fi

echo -e "${LOG_SUCCESS} You are all set, just reload your shell!"
