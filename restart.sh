#!/bin/bash
# File: restart_servers.sh
SERVERS=$(ptero-cli servers list | grep "Running" | awk '{print $1}')
for SERVER in $SERVERS; do
    ptero-cli server restart "$SERVER"
    echo "Server $SERVER telah direstart."
done
