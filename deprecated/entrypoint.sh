#!/usr/bin/env bash
function start_hbase_regionserver() {
    hbase-daemon.sh start regionserver
}

function start_hbase_master() {
    hbase-daemon.sh start master
    hbase-daemon.sh start regionserver
    hbase-daemon.sh start thrift -p ${HBASE_THRIFT_PORT}
    hbase-daemon.sh start rest -p ${HBASE_REST_PORT}
}

function start_hbase_managed_zk() {
    if [[ "${HBASE_MANAGES_ZK}" == "true" ]]
        then
            echo "export HBASE_MANAGES_ZK=true" >> "${HBASE_CONF_DIR}/hbase-env.sh"
            hbase-daemon.sh start zookeeper
    elif [[ "${HBASE_MANAGES_ZK}" == "false" ]]
        then
            echo "export HBASE_MANAGES_ZK=false" >> "${HBASE_CONF_DIR}/hbase-env.sh"
    fi
}

# Start Hadoop services with loaded configurations
./hadoop_entrypoint.sh $1

# Load HBase configurations
./hbase_config_loader.sh

# Terminate config load
echo "</configuration>" >> ${HBASE_CONF_DIR}/hbase-site.xml

start_hbase_managed_zk

[[ "${HBASE_NODE_TYPE}" == "master" ]] && start_hbase_master

[[ "${HBASE_NODE_TYPE}" == "regionserver" ]] && start_hbase_regionserver

if [[ "$1" == "hbase" ]]; then
    tail -f /dev/null
fi