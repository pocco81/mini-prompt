#!/bin/bash

LOG_INFO="$(date +"%H:%M:%S") \e[0;34mINFO\e[0m"
LOG_ERROR="$(date +"%H:%M:%S") \e[1;31mERROR\e[0m"
LOG_WARNING="$(date +"%H:%M:%S") \e[0;33mWARNING\e[0m"
LOG_SUCCESS="$(date +"%H:%M:%S") \e[0;32mSUCCESS\e[0m"

CURDIR=$1
PREFIX=$2

echo -e "${LOG_INFO} Preparing..."
mkdir -p "${PREFIX}"
echo -e "${LOG_INFO} Installing MiniPrompt under ${PREFIX}/..."
install "${CURDIR}/miniprompt" "${PREFIX}/miniprompt"
echo -e "${LOG_SUCCESS} You are all set, follow the 'getting started' instructions in the README!"
