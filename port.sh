#!/bin/bash -x

SCRIPT_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source ${SCRIPT_ROOT}/params.sh

apicup subsys create $PORT_NAME portal
apicup subsys set $PORT_NAME deployment-profile=n1xc2.m8
apicup subsys set $PORT_NAME license-use=$LICENSE_USE
apicup subsys set $PORT_NAME portal-admin=portal-admin.$PORT_ENDPOINTS_SUBDOMAIN.$DOMAIN
apicup subsys set $PORT_NAME portal-www=portal-www.$PORT_ENDPOINTS_SUBDOMAIN.$DOMAIN
apicup subsys set $PORT_NAME search-domain=$DOMAIN
apicup subsys set $PORT_NAME dns-servers=$DNS_SERVERS
apicup subsys set $PORT_NAME ssh-keyfiles=$SSH_KEY
hashed_pass=$(mkpasswd --method=sha-512 --rounds=4096 admin)
apicup subsys set $PORT_NAME default-password="$hashed_pass"
apicup hosts create $PORT_NAME $PORT_HOSTNAME.$DOMAIN "$PASSWORD"
apicup iface create $PORT_NAME $PORT_HOSTNAME.$DOMAIN eth0 $PORT_HOST_IP/$SUBNET_MASK $GATEWAY

# Backup configuration
apicup subsys set $PORT_NAME site-backup-host=s3.direct.eu-de.cloud-object-storage.appdomain.cloud
apicup subsys set $PORT_NAME site-backup-auth-user=$COS_ACCESS_KEY_ID
apicup subsys set $PORT_NAME site-backup-auth-pass=$COS_ACCESS_KEY
apicup subsys set $PORT_NAME site-backup-path=port-backup
apicup subsys set $PORT_NAME site-backup-protocol=objstore
apicup subsys set $PORT_NAME site-backup-schedule="0 0 * * *"
