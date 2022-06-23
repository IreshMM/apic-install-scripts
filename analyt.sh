#!/bin/bash

apicup subsys create analyt analytics
apicup subsys set analyt deployment-profile=n1xc2.m16
apicup subsys set analyt license-use=nonproduction
apicup subsys set analyt enable-message-queue=true
apicup subsys set analyt analytics-client=analytics-client.nsb.local
apicup subsys set analyt analytics-ingestion=analytics-ingestion.nsb.local
apicup subsys set analyt search-domain=nsb.local
apicup subsys set analyt dns-servers=161.26.0.7,161.26.0.8
apicup subsys set analyt ssh-keyfiles=~/.ssh/id_rsa.1.pub
hashed_pass=$(mkpasswd --method=sha-512 --rounds=4096 admin)
apicup subsys set analyt default-password="$hashed_pass"
apicup hosts create analyt test-apic-anytcs.nsb.local admin
apicup iface create analyt test-apic-anytcs.nsb.local  eth0 192.0.1.11/255.255.255.0 192.0.1.1
