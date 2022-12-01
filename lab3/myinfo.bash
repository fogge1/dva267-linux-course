#!/bin/bash

VERSION=0
IP=0
MAC=0
HELP=0

while true; do
  case "$1" in
    -a|--all) VERSION=1 IP=1 MAC=1 ; shift ;;
    -v|--version) VERSION=1 ; shift ;;
    -i|--ip) IP=1 ; shift ;;
    -m|--mac) MAC=1 ; shift ;;
    --help) HELP=1 ; break ;;
    --) shift ; break ;;
    *) break ;;
  esac
done

if [ $HELP -eq 1 ]; then
   echo "\
OPTIONS
-a, --all     | display all information
-v, --version | display linux version
-i, --ip      | display IP address
-m, --mac     | display MAC address
    --help    | display this help and exit" >&2
    exit 1
fi

if [ $VERSION -eq 1 ]; then
  # "uname -r"  skriver ut linux-versionen. Jag kör arch linux så lsb_release kommer inte ge något
  echo -n "linux version: " ; uname -r
fi

if [ $IP -eq 1 ]; then 
  echo -n "ip address: " ; ip addr show wlan0 | grep -Eo 'inet (addr:)?([0-9]{1,3}\.){3}[0-9]{1,3}' | cut -d' ' -f2
fi

if [ $MAC -eq 1 ]; then
  echo -n "mac address: " ; ip link show wlan0 | grep -Eo 'link/ether ([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}' | cut -d' ' -f2
fi
