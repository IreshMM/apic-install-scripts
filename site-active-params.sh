#!/bin/bash -x

SUBNET_MASK=255.255.255.128
GATEWAY=192.168.72.1
DNS_SERVERS='10.1.2.5'

# Management subsystem
MGMT_NAME="mgmt"
MGMT_HOST_IP='192.168.72.11'
MGMT_HOSTNAME='pr-apic-mgr'

# Analytics subsystem
ANALYT_NAME="analyt"
ANALYT_HOST_IP='192.168.72.12'
ANALYT_HOSTNAME='pr-apic-anytcs'

# Developer portal subsystem
PORT_NAME="port"
PORT_HOST_IP='192.168.72.13'
PORT_HOSTNAME='pr-apic-devptl'
