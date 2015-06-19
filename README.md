# neutrondev
### Set up a docker container sharing the /opt/stack

Steps:
* First start a devstack locally with DESTDIR's default value
* Start the ubuntussh docker container with following command:
**docker run -d -v /opt/stack:/opt/stack --privileged=True --name=dockerdev1 --hostname=dockerdev1 -e IPCIDR=172.17.42.2 dockerreg.99cloud.net/ubuntussh:15.04.1**
* log into the container **ssh stack@172.17.42.2** and then use it as a VM

the solution is:
Not to use 'sed -i', which does not run under docker container env, where
# the /etc/hosts are mounted from host file

people who are interested can look at the discussion of this container problem at https://github.com/travis-ci/travis-build/pull/403 
