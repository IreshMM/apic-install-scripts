#!/bin/bash -x

SCRIPT_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source ${SCRIPT_ROOT}/site-active-params.sh
source ${SCRIPT_ROOT}/mgmt.sh

apicup subsys set $MGMT_NAME multi-site-ha-enabled=true
apicup subsys set $MGMT_NAME multi-site-ha-mode=active
apicup certs set $MGMT_NAME management-replication-ingress --clear
apicup subsys set $MGMT_NAME management-replication="mgrreplication${ACTIVE_SITE_NAME}.apic${ACTIVE_SITE_NAME}.${DOMAIN}"
apicup subsys set $MGMT_NAME replication-peer-fqdn="mgrreplication${PASSIVE_SITE_NAME}.apic${PASSIVE_SITE_NAME}.${DOMAIN}"
apicup subsys set $MGMT_NAME site-name=$ACTIVE_SITE_NAME


apicup subsys install $MGMT_NAME --out "${MGMT_NAME}-plan-out"
apicup certs get $MGMT_NAME encryption-secret -t key > mgmt-encryption-secret
