#!/bin/sh
#Example: ./suning-tools/install-code.sh "10.27.2.38 10.27.2.40 10.27.2.41"
base_path="/usr/lib/python2.6/site-packages/neutron"

server_list="$1"
target_list="services/loadbalancer/drivers/haproxy/namespace_driver.py services/loadbalancer/agent/agent_manager.py services/loadbalancer/agent/agent_api.py services/loadbalancer/agent_scheduler.py services/loadbalancer/drivers/common/agent_driver_base.py"

for server in $server_list; do
    for target in $target_list; do
        scp $target root@${server}:${base_path}/${target}
    done
done


