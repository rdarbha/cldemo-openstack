ansible-playbook run-demo.yml
ssh server01 ". demo-openrc; openstack server create --flavor m1.nano --image cirros --nic net-id=provider --security-group default cirros01"
sleep 60
ssh server01 ping 192.168.0.101 -c 1
ssh server01 ". demo-openrc; neutron net-create demonet"
ssh server01 ". demo-openrc; neutron subnet-create --name demonet --dns-nameserver 8.8.8.8 --gateway 200.0.0.1 demonet 200.0.0.0/24"
ssh server01 ". demo-openrc; neutron router-create demorouter"
ssh server01 ". demo-openrc; neutron router-interface-add demorouter demonet"
ssh server01 ". demo-openrc; neutron router-gateway-set demorouter provider"
ssh server01 ". demo-openrc; openstack server create --flavor m1.nano --image cirros --nic net-id=demonet --security-group default cirros02"
ssh server01 ". demo-openrc; openstack ip floating create provider"
ssh server01 ". demo-openrc; openstack ip floating add 192.168.0.103 cirros02"
sleep 60
ssh server01 ping 192.168.0.103 -c 1
