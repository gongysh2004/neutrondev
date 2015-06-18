# neutrondev
first start devstack locally with DESTDIR's default value
then start the ubuntussh docker container with following command:
docker run -d -v /opt/stack:/opt/stack --privileged=True --name=dockerdev1 --hostname=dockerdev1 -e IPCIDR=172.17.42.2 dockerreg.99cloud.net/ubuntussh:15.04.1
