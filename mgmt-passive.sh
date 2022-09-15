#!/bin/bash -x

SCRIPT_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source ${SCRIPT_ROOT}/site-passive-params.sh
source ${SCRIPT_ROOT}/mgmt.sh

apicup subsys set $MGMT_NAME multi-site-ha-enabled=true
apicup subsys set $MGMT_NAME multi-site-ha-mode=passive
apicup certs set $MGMT_NAME management-replication-ingress --clear
apicup subsys set $MGMT_NAME management-replication="mgrreplication${PASSIVE_SITE_NAME}.apic${PASSIVE_SITE_NAME}.${DOMAIN}"
apicup subsys set $MGMT_NAME replication-peer-fqdn="mgrreplication${ACTIVE_SITE_NAME}.apic${ACTIVE_SITE_NAME}.${DOMAIN}"
apicup subsys set $MGMT_NAME site-name=$PASSIVE_SITE_NAME

apicup certs set $MGMT_NAME encryption-secret mgmt-encryption-secret
apicup subsys install $MGMT_NAME --out "${MGMT_NAME}-plan-out"
