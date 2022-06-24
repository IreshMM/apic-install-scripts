#!/bin/bash -x

source `dirname $0`/params.sh

apicup subsys create analyt analytics
apicup subsys set analyt deployment-profile=n1xc2.m16
apicup subsys set analyt license-use=$LICENSE_USE
apicup subsys set analyt enable-message-queue=true
apicup subsys set analyt analytics-client=analytics-client.$ANALYT_HOSTNAME.$DOMAIN
apicup subsys set analyt analytics-ingestion=analytics-ingestion.$ANALYT_HOSTNAME.$DOMAIN
apicup subsys set analyt search-domain=$DOMAIN
apicup subsys set analyt dns-servers=$DNS_SERVERS
apicup subsys set analyt ssh-keyfiles=$SSH_KEY
hashed_pass=$(mkpasswd --method=sha-512 --rounds=4096 "$PASSWORD")
apicup subsys set analyt default-password="$hashed_pass"
apicup hosts create analyt $ANALYT_HOST_IP.$DOMAIN "$PASSWORD"
apicup iface create analyt $ANALYT_HOST_IP.$DOMAIN  eth0 $ANALYT_HOST_IP/$SUBNET_MASK $GATEWAY
