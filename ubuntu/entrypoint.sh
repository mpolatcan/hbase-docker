#!/usr/bin/env bash

function execCmd() { su - hduser -s /bin/bash -c "$1"; }

function appendToFile() { echo "$1" >> "$2"; }

function startHBaseRegionserver() {
    if [[ "${HBASE_MANAGES_ZK}" == "true" ]]
        then
            appendToFile "export HBASE_MANAGES_ZK=true" "${HBASE_CONF_DIR}/hbase-env.sh"
            execCmd "${HBASE_HOME}/bin/hbase-daemon.sh start zookeeper"
    elif [[ "${HBASE_MANAGES_ZK}" == "false" ]]
        then
            appendToFile "export HBASE_MANAGES_ZK=false" "${HBASE_CONF_DIR}/hbase-env.sh"
    fi

    execCmd "${HBASE_HOME}/bin/hbase-daemon.sh start regionserver"
}

function startHBaseMaster() {
    if [[ "${HBASE_MANAGES_ZK}" == "true" ]]
        then
            appendToFile "export HBASE_MANAGES_ZK=true" "${HBASE_CONF_DIR}/hbase-env.sh"
            execCmd "${HBASE_HOME}/bin/hbase-daemon.sh start zookeeper"
    elif [[ "${HBASE_MANAGES_ZK}" == "false" ]]
        then
            appendToFile "export HBASE_MANAGES_ZK=false" "${HBASE_CONF_DIR}/hbase-env.sh"
    fi

    execCmd "${HBASE_HOME}/bin/hbase-daemon.sh start master"
    execCmd "${HBASE_HOME}/bin/hbase-daemon.sh start regionserver"
    execCmd "${HBASE_HOME}/bin/hbase-daemon.sh start thrift -p ${HBASE_THRIFT_PORT}"
    execCmd "${HBASE_HOME}/bin/hbase-daemon.sh start rest -p ${HBASE_REST_PORT}"
}

# Start Hadoop services with loaded configurations
./hadoop_entrypoint.sh

# Load HBase configurations
/hbase_config_loader.sh

# Terminate config load
echo "</configuration>" >> ${HBASE_CONF_DIR}/hbase-site.xml

[[ "${HBASE_NODE_TYPE}" == "master" ]] && startHBaseMaster

[[ "${HBASE_NODE_TYPE}" == "regionserver" ]] && startHBaseRegionserver