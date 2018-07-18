#!/usr/bin/env bash

function execCmd() { su - hduser -s /bin/bash -c "$1"; }

function appendToFile() { echo "$1" >> "$2"; }

function startNamenode() {
    # Formatting HDFS
    [[ ! -d "${HADOOP_TMP_DIR}/dfs" ]] && execCmd "${HADOOP_HOME}/bin/hadoop namenode -format"

    # Start Hadoop Namenode
    execCmd "${HADOOP_HOME}/sbin/hadoop-daemon.sh start namenode"

    # Start Hadoop Secondary namenode
    execCmd "${HADOOP_HOME}/sbin/hadoop-daemon.sh start secondarynamenode"

    # Start Hadoop Datanode
    execCmd "${HADOOP_HOME}/sbin/hadoop-daemon.sh start datanode"

    # Start YARN Resourcemanager
    execCmd "${HADOOP_HOME}/sbin/yarn-daemon.sh start resourcemanager"

    # Start YARN Nodemanager
    execCmd "${HADOOP_HOME}/sbin/yarn-daemon.sh start nodemanager"

    # Start JobHistory server
    execCmd "${HADOOP_HOME}/sbin/mr-jobhistory-daemon.sh start historyserver"
}

function startDatanode() {
    # Start Datanode
    execCmd "${HADOOP_HOME}/sbin/hadoop-daemon.sh start datanode"

    # Start YARN Nodemanager
    execCmd "${HADOOP_HOME}/sbin/yarn-daemon.sh start nodemanager"
}

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
}

# Load Hadoop configs
./hadoop_config_loader.sh

[[ "${HADOOP_NODE_TYPE}" == "namenode" ]] && startNamenode

[[ "${HADOOP_NODE_TYPE}" == "datanode" ]] && startDatanode

# Load HBase configurations
hbase_config_loader.sh

[[ "${HBASE_NODE_TYPE}" == "master" ]] && startHBaseMaster

[[ "${HBASE_NODE_TYPE}" == "regionserver" ]] && startHBaseRegionserver

tail -f /dev/null