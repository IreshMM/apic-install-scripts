#!/bin/bash

# Common params
LICENSE_USE=production
DOMAIN=nsb.local
DNS_SERVERS='10.1.2.5'
SSH_KEY='~/.ssh/id_rsa.pub'
PASSWORD=${PASSWORD:-test@12345}
SUBNET_MASK=255.255.255.128
GATEWAY="192.168.72.1"

# Management subsystem
MGMT_NAME=mgmt
MGMT_HOST_IP="192.168.72.11"
MGMT_HOSTNAME=pr-apic-mgr

# Analytics subsystem
ANALYT_NAME=analyt
ANALYT_HOST_IP="192.168.72.12"
ANALYT_HOSTNAME=pr-apic-anytcs

# Developer portal subsystem
PORT_NAME=port
PORT_HOST_IP="192.168.72.13"
PORT_HOSTNAME=pr-apic-devptl
