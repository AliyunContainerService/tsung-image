#!/bin/sh
if [ $# -lt 1 ]; then
    echo "You should set the work mode"
    exit 1
fi

mode="$1"

if [ "$mode" = "single" ]; then
  tsung -k start
fi

if [ "$mode" = "master" ]; then
  /entry.sh /usr/sbin/sshd -d -f /etc/ssh/sshd_config & >> /dev/null;
  tsung -k start
fi

if [ "$mode" = "slave" ]; then
  /entry.sh /usr/sbin/sshd -d -f /etc/ssh/sshd_config & >> /dev/null;
  top -b
fi
