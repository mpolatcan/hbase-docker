#!/bin/bash

function start_daemons() {
  for daemon in ${HBASE_DAEMONS[@]}; do
      # Start current daemon
      hbase-daemon.sh start $daemon
  done

  if [[ "${HBASE_MANAGES_ZK}" == "true" ]]; then
      hbase-daemon.sh start zookeeper
  fi
}

function load_configs() {
    # Load HBase configs of hbase-site.xml
    ./hbase_config_loader.sh

    # Load HBase configs of hbase-env.sh
    echo "export HBASE_MANAGES_ZK=${HBASE_MANAGES_ZK}" >> "${HBASE_CONF_DIR}/hbase-env.sh"

    if [[ "${HBASE_HEAPSIZE}" != "NULL" ]]; then
      echo "export HBASE_HEAPSIZE=${HBASE_HEAPSIZE}" >> "${HBASE_CONF_DIR}/hbase-env.sh"
    fi

    if [[ "${HBASE_OFFHEAPSIZE}" != "NULL" ]]; then
      echo "export HBASE_OFFHEAPSIZE=${HBASE_OFFHEAPSIZE}" >> "${HBASE_CONF_DIR}/hbase-env.sh"
    fi
}

# Start Loading configs of HBase
load_configs

# Start HBase Daemons
[[ "${HBASE_DAEMONS}" != "NULL" ]] && start_daemons

tail -f /dev/null