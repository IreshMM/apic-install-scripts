#!/bin/bash -x

SCRIPT_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source ${SCRIPT_ROOT}/site-active-params.sh
source ${SCRIPT_ROOT}/analyt.sh

apicup subsys install $ANALYT_NAME --out "${ANALYT_NAME}-plan-out"
