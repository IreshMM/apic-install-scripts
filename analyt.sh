#!/bin/bash -x

SCRIPT_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source ${SCRIPT_ROOT}/params.sh

apicup subsys create $ANALYT_NAME analytics
apicup subsys set $ANALYT_NAME deployment-profile=n1xc2.m16
apicup subsys set $ANALYT_NAME license-use=$LICENSE_USE
apicup subsys set $ANALYT_NAME enable-message-queue=false
apicup subsys set $ANALYT_NAME analytics-client=analytics-client.$ANALYT_ENDPOINTS_SUBDOMAIN.$DOMAIN
apicup subsys set $ANALYT_NAME analytics-ingestion=analytics-ingestion.$ANALYT_ENDPOINTS_SUBDOMAIN.$DOMAIN
apicup subsys set $ANALYT_NAME search-domain=$DOMAIN
apicup subsys set $ANALYT_NAME dns-servers=$DNS_SERVERS
apicup subsys set $ANALYT_NAME ssh-keyfiles=$SSH_KEY
hashed_pass=$(mkpasswd --method=sha-512 --rounds=4096 "$PASSWORD")
apicup subsys set $ANALYT_NAME default-password="$hashed_pass"
apicup hosts create $ANALYT_NAME $ANALYT_HOSTNAME.$DOMAIN "$PASSWORD"
apicup iface create $ANALYT_NAME $ANALYT_HOSTNAME.$DOMAIN  eth0 $ANALYT_HOST_IP/$SUBNET_MASK $GATEWAY
# apicup subsys set $ANALYT_NAME extra-values-file=${SCRIPT_ROOT}/analytics-extra-values.yaml


# Backup configuration
apicup subsys set $ANALYT_NAME analytics-backup-auth-pass=$COS_ACCESS_KEY
apicup subsys set $ANALYT_NAME analytics-backup-auth-user=$COS_ACCESS_KEY_ID
apicup subsys set $ANALYT_NAME analytics-backup-host=s3.direct.eu-de.cloud-object-storage.appdomain.cloud
apicup subsys set $ANALYT_NAME analytics-backup-path=analyt-backup
apicup subsys set $ANALYT_NAME analytics-backup-chunk-size=1GB
apicup subsys set $ANALYT_NAME analytics-backup-schedule='0 0 * * *'

