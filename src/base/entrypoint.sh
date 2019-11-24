#!/bin/bash

function start_daemons() {
  for daemon in ${HBASE_DAEMONS[@]}; do
      # Start current daemon
      hbase-daemon.sh start $daemon
  done
}

# Load HBase configs
./hbase_config_loader.sh

# Start Hadoop Daemons
[[ "${HBASE_DAEMONS}" != "NULL" ]] && start_daemons

tail -f /dev/null