#!/bin/bash -x

SCRIPT_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source ${SCRIPT_ROOT}/params.sh

apicup subsys create $MGMT_NAME management
apicup subsys set $MGMT_NAME deployment-profile=n1xc4.m16
apicup subsys set $MGMT_NAME license-use=$LICENSE_USE
apicup subsys set $MGMT_NAME search-domain=$DOMAIN
apicup subsys set $MGMT_NAME dns-servers=$DNS_SERVERS
apicup subsys set $MGMT_NAME platform-api=platform-api.$MGMT_HOSTNAME.$DOMAIN
apicup subsys set $MGMT_NAME consumer-api=consumer-api.$MGMT_HOSTNAME.$DOMAIN
apicup subsys set $MGMT_NAME cloud-admin-ui=cloud-admin-ui.$MGMT_HOSTNAME.$DOMAIN
apicup subsys set $MGMT_NAME api-manager-ui=api-manager-ui.$MGMT_HOSTNAME.$DOMAIN
apicup subsys set $MGMT_NAME hub=hub.$MGMT_HOSTNAME.$DOMAIN
apicup subsys set $MGMT_NAME turnstile=turnstile.$MGMT_HOSTNAME.$DOMAIN
apicup subsys set $MGMT_NAME ssh-keyfiles=$SSH_KEY
hashed_pass=$(mkpasswd --method=sha-512 --rounds=4096 "$PASSWORD")
apicup subsys set $MGMT_NAME default-password="$hashed_pass"
apicup hosts create $MGMT_NAME $MGMT_HOSTNAME.$DOMAIN "$PASSWORD"
apicup iface create $MGMT_NAME $MGMT_HOSTNAME.$DOMAIN eth0 $MGMT_HOST_IP/$SUBNET_MASK $GATEWAY
