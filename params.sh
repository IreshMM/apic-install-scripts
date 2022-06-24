#!/bin/bash

# Common params
LICENSE_USE=nonproduction
DOMAIN=nsb.local
DNS_SERVERS='161.26.0.7,161.26.0.8'
SSH_KEY='~/.ssh/id_rsa.1.pub'
PASSWORD=
SUBNET_MASK=255.255.255.0                                                                                                          
GATEWAY=192.0.1.1

# Management subsystem
MGMT_HOST_IP=192.0.1.10
MGMT_HOSTNAME=test-apic-mgr

# Analytics subsystem
ANALYT_HOST_IP=192.0.1.11
ANALYT_HOSTNAME=test-apic-anytcs

# Developer portal subsystem
PORT_HOST_IP=192.0.1.12
PORT_HOSTNAME=test-apic-devptl
