#!/bin/bash

function load_configs() {
    # Load HBase configs of hbase-site.xml
    ./hbase_config_loader.sh

    # Load HBase configs of hbase-env.sh
    echo "export HBASE_MANAGES_ZK=${HBASE_MANAGES_ZK}" >> "${HBASE_CONF_DIR}/hbase-env.sh"

    if [[ "${HBASE_HEAP_SIZE}" != "NULL" ]]; then
        echo "export HBASE_HEAPSIZE=${HBASE_HEAP_SIZE}" >> "${HBASE_CONF_DIR}/hbase-env.sh"
    fi

    if [[ "${HBASE_OFFHEAP_SIZE}" != "NULL" ]]; then
        echo "export HBASE_OFFHEAPSIZE=${HBASE_OFFHEAP_SIZE}" >> "${HBASE_CONF_DIR}/hbase-env.sh"
    fi
}


function start_daemons() {
  for daemon in ${HBASE_DAEMONS[@]}; do
      echo "Starting HBase daemons \"$daemon\"..."

      # Start current daemon
      hbase-daemon.sh start $daemon
  done

  if [[ "${HBASE_MANAGES_ZK}" == "true" ]]; then
      hbase-daemon.sh start zookeeper
  fi

  # If Apache Phoenix is enabled then start Phoenix Queryserver
  if [[ "${PHOENIX_ENABLED}" == "true" ]]; then
      queryserver.py start
  fi
}

# Start Loading configs of HBase
load_configs

# Start HBase Daemons
if [[ "${HBASE_DAEMONS}" != "NULL" ]]; then
  start_daemons
fi

tail -f /dev/null