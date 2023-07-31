#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731
# ssl-cert.sh

# This was copied over so I have it here, but it is not yet been modified for
# Ubuntu and likely will not work correctly


# script to setup a self signed ssl cert.
# args expected are as follows
# 1: FQDN
# 2: DORG is the org, eg "DNVR.RED"
# Other settings such as OU, Country, State, and city are currently hard coded for my use,
# but could be passed as additional args.

FQDN=$1
ORG=$2
DOMAIN="$FQDN"
OU='IT'
COUNTRY='US'
STATE='COLORADO'
CITY='DENVER'

cd /root/
mkdir -p /root/ssl/{ca,self}

openssl req -new -sha256 -nodes -newkey rsa:2048 -keyout /root/ssl/ca/$FQDN.key -out /root/ssl/ca/$FQDN.csr  -subj "/O=$ORG/CN=$DOMAIN/OU=$OU/C=$COUNTRY/ST=$STATE/L=$CITY" -addext "subjectAltName = DNS:$FQDN"
chmod 400 /root/ssl/ca/*
openssl req -x509 -sha256 -nodes -days 3650 -newkey rsa:2048 -keyout /root/ssl/self/$FQDN.key -out /root/ssl/self/$FQDN.crt -subj "/O=$ORG/CN=$DOMAIN/OU=$OU/C=$COUNTRY/ST=$STATE/L=$CITY" -addext "subjectAltName = DNS:$FQDN"
chmod 400 /root/ssl/self/*

cp /root/ssl/self/$FQDN.key /etc/ssl/private/
chmod 700 /etc/ssl/private
cp /root/ssl/self/$FQDN.crt /etc/ssl/certs/
chmod 700 /etc/ssl/certs
cat /root/ssl/ca/$FQDN.csr > /root/ssl/$FQDN.request.txt
