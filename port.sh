#!/bin/bash

apicup subsys create port portal
apicup subsys set port deployment-profile=n1xc2.m8
apicup subsys set port license-use=nonproduction
apicup subsys set port enable-message-queue=true
apicup subsys set port portal-admin=portal-admin.test-apic-devptl.nsb.local
apicup subsys set port portal-www=portal-www.test-apic-devptl.nsb.local
apicup subsys set port search-domain=nsb.local
apicup subsys set port dns-servers=161.26.0.7,161.26.0.8
apicup subsys set port ssh-keyfiles=~/.ssh/id_rsa.1.pub
hashed_pass=$(mkpasswd --method=sha-512 --rounds=4096 admin)
apicup subsys set port default-password="$hashed_pass"
apicup hosts create port test-apic-devptl.local admin
apicup iface create port test-apic-devptl.local eth0 192.0.1.12/255.255.255.0 192.0.1.1
