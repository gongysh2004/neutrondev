#!/bin/bash
echo "Set IP address according to env IPCIDR .."
if [[ "y${IPCIDR}y" = "yy" ]]; then
  echo "Bad IPCIDR"
  exit 1
fi
ifconfig eth0 ${IPCIDR} up
echo "Start sshd in foregroud mode ..."
/usr/sbin/sshd -D
