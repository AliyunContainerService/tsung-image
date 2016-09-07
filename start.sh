#!/bin/sh
if [ $# -lt 1 ]; then
    echo "You should set the work mode"
    exit 1
fi

mode="$1"

if [ "$mode" = "single" ]; then
  tusng -k start
fi

if [ "$mode" = "master" ]; then
  /entry.sh /usr/sbin/sshd -d -f /etc/ssh/sshd_config;
  tsung -k start
fi

if [ "$mode" = "slave" ]; then
  /entry.sh /usr/sbin/sshd -d -f /etc/ssh/sshd_config;
  top -b
fi
