#!/bin/bash -x

SCRIPT_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source ${SCRIPT_ROOT}/site-active-params.sh
source ${SCRIPT_ROOT}/port.sh

apicup subsys set $PORT_NAME multi-site-ha-enabled=true
apicup subsys set $PORT_NAME multi-site-ha-mode=active
apicup certs set $PORT_NAME portal-replication-ingress --clear
apicup subsys set $PORT_NAME portal-replication="ptlreplication${ACTIVE_SITE_NAME}.apic${ACTIVE_SITE_NAME}.${DOMAIN}"
apicup subsys set $PORT_NAME replication-peer-fqdn="ptlreplication${PASSIVE_SITE_NAME}.apic${PASSIVE_SITE_NAME}.${DOMAIN}"
apicup subsys set $PORT_NAME site-name=$ACTIVE_SITE_NAME

apicup subsys install $PORT_NAME --out "${PORT_NAME}-plan-out"
apicup certs get $PORT_NAME encryption-secret -t key > port-encryption-secret
