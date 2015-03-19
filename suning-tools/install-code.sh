#!/bin/sh
#Example: ./suning-tools/install-code.sh "10.27.2.38 10.27.2.40 10.27.2.41"
base_path="/usr/lib/python2.6/site-packages/neutron"
client_base_path="/usr/lib/python2.6/site-packages"

server_list="$1"
target_list="db/loadbalancer_db.py extensions/loadbalancer.py services/loadbalancer/drivers/haproxy/cfg.py services/loadbalancer/drivers/haproxy/namespace_driver.py services/loadbalancer/agent/agent_manager.py services/loadbalancer/agent/agent_api.py services/loadbalancer/agent_scheduler.py services/loadbalancer/drivers/common/agent_driver_base.py"
client_target_list="neutronclient/neutron/v2_0/lb/pool.py"

for server in $server_list; do
    for target in $target_list; do
        scp $target root@${server}:${base_path}/${target}
    done
done


for server in $server_list; do
    for client_target in $client_target_list; do
        scp $client_target root@${server}:${client_base_path}/${client_target}
    done
done
