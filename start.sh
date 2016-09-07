#/bin/bash
if [ $# -lt 1 ]; then
    echo "You should set the work mode"
    exit 1
fi

mode="$1"

if [ "$mode" == "single" ]
  tusng -k start
fi

if [ "$mode" == "master" ]
  /entry.sh /usr/sbin/sshd -d -f /etc/ssh/sshd_config;
  tsung -k start
fi

if [ "$mode" == "slave" ]
  /entry.sh /usr/sbin/sshd -d -f /etc/ssh/sshd_config;
  top -b
fi
