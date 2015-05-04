#!/bin/sh
#Example: ./suning-tools/install-keys.sh "10.27.2.38 10.27.2.40 10.27.2.41"
server_list="$1"

for server in $server_list; do
    ssh $server 'ls /root/.ssh/pack-2.pub'
    if [ $? != 0 ]; then
        scp /root/.ssh/id_rsa.pub root@${server}:/root/.ssh/pack-2.pub
        ssh $server 'cat /root/.ssh/pack-2.pub >> /root/.ssh/authorized_keys'
    fi
done
