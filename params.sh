#!/bin/bash

# Common params
LICENSE_USE=production
DOMAIN=nsb.local
DNS_SERVERS=${DNS_SERVERS:-'10.1.2.5'}
SSH_KEY='~/.ssh/id_rsa.pub'
PASSWORD=${PASSWORD:-'test@12345'}
SUBNET_MASK=${SUBNET_MASK:-'255.255.255.128'}
GATEWAY=${GATEWAY:-'192.168.72.1'}

# Management subsystem
MGMT_NAME=${MGMT_NAME:-'mgmt'}
MGMT_HOST_IP=${MGMT_HOST_IP:-'192.168.72.11'}
MGMT_HOSTNAME=${MGMT_HOSTNAME:-'pr-apic-mgr'}

# Analytics subsystem
ANALYT_NAME=${ANALYT_NAME:-'analyt'}
ANALYT_HOST_IP=${ANALYT_HOST_IP:-'192.168.72.12'}
ANALYT_HOSTNAME=${ANALYT_HOSTNAME:-'pr-apic-anytcs'}

# Developer portal subsystem
PORT_NAME=${PORT_NAME:-'port'}
PORT_HOST_IP=${PORT_HOST_IP:-'192.168.72.13'}
PORT_HOSTNAME=${PORT_HOSTNAME:-'pr-apic-devptl'}
