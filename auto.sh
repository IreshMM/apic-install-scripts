#!/bin/bash

PROJECT_NAME="$1"

SCRIPT_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
${SCRIPT_ROOT}/init.sh "$PROJECT_NAME"
cd "$PROJECT_NAME"
${SCRIPT_ROOT}/mgmt-active.sh
${SCRIPT_ROOT}/analyt-active.sh
${SCRIPT_ROOT}/port-active.sh
${SCRIPT_ROOT}/mgmt-passive.sh
${SCRIPT_ROOT}/analyt-passive.sh
${SCRIPT_ROOT}/port-passive.sh

