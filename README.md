Openstack Demo
==============
This demo is an ansible playbook that installs Openstack Juno on the reference topology.

This demo is written for the [cldemo-vagrant](https://github.com/cumulusnetworks/cldemo-vagrant) reference topology and applies the reference BGP unnumbered configuration from [cldemo-config-routing](https://github.com/cumulusnetworks/cldemo-config-routing).


Quickstart: Run the demo
------------------------
(This assumes you are running Ansible 1.9.4 and Vagrant 1.8.4 on your host.)

    git clone https://github.com/cumulusnetworks/cldemo-vagrant
    cd cldemo-vagrant

Before you get started, you will need to increase the memory allocated to server01.
Find the file named `Vagrantfile` and find the stanza for `server01`. Replace
`v.memory = 512` with `v.memory = 3072`.

    vagrant up oob-mgmt-server oob-mgmt-switch leaf01 leaf02 spine01 spine02 server01 server02 leaf03 leaf04 server03 server04
    vagrant ssh oob-mgmt-server
    sudo su - cumulus
    sudo apt-get install software-properties-common -y
    sudo apt-add-repository ppa:ansible/ansible -y
    sudo apt-get update
    sudo apt-get install ansible -qy
    git clone https://github.com/cumulusnetworks/cldemo-openstack
    cd cldemo-openstack
    ansible-playbook run-demo.yml


Tips
----
Open the tunnel:

    ssh -L 6080:localhost:8888 cumulus@127.0.0.1 -p 2222 ssh -L 8888:controller:6080 server01
    ssh -L 8080:server01:80 cumulus@127.0.0.1 -p 2222
