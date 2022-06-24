#!/bin/bash

source `dirname $0`/params.sh

apicup subsys create mgmt management
apicup subsys set mgmt deployment-profile=n1xc4.m16
apicup subsys set mgmt license-use=$LICENSE_USE
apicup subsys set mgmt search-domain=$DOMAIN
apicup subsys set mgmt dns-servers=$DNS_SERVERS
apicup subsys set mgmt platform-api=platform-api.$MGMT_HOSTNAME.$DOMAIN
apicup subsys set mgmt consumer-api=consumer-api.$MGMT_HOSTNAME.$DOMAIN
apicup subsys set mgmt cloud-admin-ui=cloud-admin-ui.$MGMT_HOSTNAME.$DOMAIN
apicup subsys set mgmt api-manager-ui=api-manager-ui.$MGMT_HOSTNAME.$DOMAIN
apicup subsys set mgmt hub=hub.test-apic-mgr.$DOMAIN
apicup subsys set mgmt turnstile=turnstile.$MGMT_HOSTNAME.$DOMAIN
apicup subsys set mgmt ssh-keyfiles=$SSH_KEY
hashed_pass=$(mkpasswd --method=sha-512 --rounds=4096 "$PASSWORD")
apicup subsys set mgmt default-password="$hashed_pass"
apicup hosts create mgmt $MGMT_HOSTNAME.$DOMAIN "$PASSWORD"
apicup iface create mgmt $MGMT_HOSTNAME.$DOMAIN eth0 $MGMT_HOST_IP/$SUBNET_MASK $GATEWAY
