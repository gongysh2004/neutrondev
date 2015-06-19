#!/bin/bash
echo "Set IP address according to env IPCIDR .."
if [[ "y${IPCIDR}y" = "yy" ]]; then
  echo "Bad IPCIDR"
  exit 1
fi
ifconfig eth0 ${IPCIDR} up
echo "Set default gateway according to env GATEWAY .."
if [[ "y${GATEWAY}y" = "yy" ]]; then
  echo "Bad GATEWAT"
  exit 1
fi
ip r replace default via $GATEWAY
echo "Start sshd in foregroud mode ..."
/usr/sbin/sshd -D
