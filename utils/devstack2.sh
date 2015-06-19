#!/bin/bash
gateway=`ifconfig docker0 | grep "inet addr" | awk -e '{print $2}' | cut -d: -f2`
docker run -d -v /opt/stack:/opt/stack --privileged=True --name=dockerdev1 --hostname=dockerdev1 -e IPCIDR=172.17.42.2 -e GATEWAY=$gateway dockerreg.99cloud.net/ubuntussh:15.04.4
ssh-keygen -f "/home/gongysh/.ssh/known_hosts" -R 172.17.42.2
echo "use ssh stack@172.17.42.2 to log in it"
