[[local|localrc]]
LIBS_FROM_GIT=False
ENABLE_DEBUG_LOG_LEVEL=False
KEYSTONE_TOKEN_FORMAT=UUID
HOST_IP=172.17.42.2
LOGFILE=/opt/stack/logs2/stack.sh.log
DATABASE_TYPE=mysql
SERVICE_HOST=172.17.42.1
MYSQL_HOST=$SERVICE_HOST
RABBIT_HOST=$SERVICE_HOST
GLANCE_HOSTPORT=$SERVICE_HOST:9292
ENABLE_HTTPD_MOD_WSGI_SERVICES=False
ENABLED_SERVICES=n-cpu,neutron,q-l3,q-agt
NOVA_VNC_ENABLED=True
NOVNCPROXY_URL="http://172.17.42.1:6080/vnc_auto.html"
VNCSERVER_LISTEN=0.0.0.0
VNCSERVER_PROXYCLIENT_ADDRESS=$HOST_IP
Q_USE_ROOTWRAP=False

SPICEHTML5PROXY_URL=http://$SERVICE_HOST:6082/spice_auto.html
Q_PLUGIN=ml2
Q_AGENT=openvswitch
DATABASE_PASSWORD=root
RABBIT_PASSWORD=password
Q_DVR_MODE=dvr_snat

SERVICE_PASSWORD=password
ADMIN_PASSWORD=admin
SCREEN_LOGDIR=$DEST/logs2/screen

[[post-config|/etc/neutron/neutron.conf]]
[DEFAULT]
router_auto_schedule = False

[[post-config|/etc/neutron/plugins/ml2/ml2_conf.ini]]
[ml2]
[ml2_type_flat]
[ml2_type_vlan]
[ml2_type_vxlan]
[ovs]
local_ip = 172.17.42.2
#bridge_mappings = net1:br-eth1
[agent]
l2_population = True 
arp_responder = True 
tunnel_types = vxlan,gre
enable_distributed_routing = True

[linux_bridge]
[vxlan]
enable_vxlan = True
local_ip = 172.17.42.2
[[post-config|/etc/neutron/l3_agent.ini]]
[DEFAULT]
router_delete_namespaces = True
root_helper = sudo

[[post-config|/etc/ceilometer/ceilometer.conf]]
[DEFAULT]
nova_http_log_debug = True

[service_credentials]
os_auth_url =  http://172.17.42.1:5000/v2.0
os_region_name = RegionOne

