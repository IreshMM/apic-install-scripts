#!/bin/bash -x

source `dirname $0`/params.sh

apicup subsys create port portal
apicup subsys set port deployment-profile=n1xc2.m8
apicup subsys set port license-use=$LICENSE_USE
apicup subsys set port portal-admin=portal-admin.$PORT_HOSTNAME.$DOMAIN
apicup subsys set port portal-www=portal-www.$PORT_HOSTNAME.$DOMAIN
apicup subsys set port search-domain=$DOMAIN
apicup subsys set port dns-servers=$DNS_SERVERS
apicup subsys set port ssh-keyfiles=$SSH_KEY
hashed_pass=$(mkpasswd --method=sha-512 --rounds=4096 admin)
apicup subsys set port default-password="$hashed_pass"
apicup hosts create port $PORT_HOST_IP.$DOMAIN "$PASSWORD"
apicup iface create port $PORT_HOST_IP.$DOMAIN eth0 $PORT_HOST_IP/$SUBNET_MASK $GATEWAY
