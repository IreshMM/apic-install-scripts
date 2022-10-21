#!/bin/bash -x

SCRIPT_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source ${SCRIPT_ROOT}/site-passive-params.sh
source ${SCRIPT_ROOT}/mgmt.sh

apicup subsys install $MGMT_NAME --out "${MGMT_NAME}-plan-out"
