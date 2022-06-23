#/bin/bash

apicup subsys create mgmt management
apicup subsys set mgmt deployment-profile=n1xc4.m16
apicup subsys set mgmt license-use=nonproduction
apicup subsys set mgmt search-domain=nsb.local
apicup subsys set mgmt dns-servers=161.26.0.7,161.26.0.8
apicup subsys set mgmt platform-api=platform-api.test-apic-mgr-nsb.local
apicup subsys set mgmt consumer-api=consumer-api.test-apic-mgr-nsb.local
apicup subsys set mgmt cloud-admin-ui=cloud-admin-ui.test-apic-mgr-nsb.local
apicup subsys set mgmt api-manager-ui=api-manager-ui.test-apic-mgr-nsb.local
apicup subsys set mgmt hub=hub.test-apic-mgr-nsb.local
apicup subsys set mgmt turnstile=turnstile.test-apic-mgr-nsb.local
apicup subsys set mgmt ssh-keyfiles=~/.ssh/id_rsa.1.pub
hashed_pass=$(mkpasswd --method=sha-512 --rounds=4096 admin)
apicup subsys set mgmt default-password="$hashed_pass"
apicup hosts create mgmt test-apic-mgr-nsb.local admin
apicup iface create mgmt test-apic-mgr-nsb.local eth0 192.0.1.10/255.255.255.0 192.0.1.1
