#!/bin/bash -x

SCRIPT_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source ${SCRIPT_ROOT}/site-active-params.sh
source ${SCRIPT_ROOT}/port.sh

apicup subsys install $PORT_NAME --out "${PORT_NAME}-plan-out"
