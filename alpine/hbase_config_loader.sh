#!/usr/bin/env bash
function loadConfig() {
    if [[ "$2" != "NULL" ]]
        then
            printf "\t<property>\n\t\t<name>$1</name>\n\t\t<value>$2</value>\n\t</property>\n" >> "${HBASE_CONF_DIR}/$3"
    fi
}

function loadConfigWithOption() {
    if [[ "$2" != "NULL" ]]
        then
            printf "\t<property>\n\t\t<name>$1</name>\n\t\t<value>$3</value>\n\t</property>\n" >> "${HBASE_CONF_DIR}/$5"
    else
        printf "\t<property>\n\t\t<name>$1</name>\n\t\t<value>$4</value>\n\t</property>\n" >> "${HBASE_CONF_DIR}/$5"
    fi
}

echo "<configuration>" > ${HBASE_CONF_DIR}/hbase-site.xml
loadConfig "hbase.cluster.distributed" "${HBASE_CLUSTER_DISTRIBUTED}" "hbase-site.xml"
loadConfig "hbase.zookeeper.property.clientPort" "${HBASE_ZK_CLIENT_PORT}" "hbase-site.xml"
loadConfig "hbase.client.retries.number" "${HBASE_CLIENT_RETRIES_NUMBER}" "hbase-site.xml"
loadConfig "zookeeper.recovery.retry" "${HBASE_ZK_RECOVERY_RETRY}" "hbase-site.xml"
loadConfig "zookeeper.session.timeout" "${HBASE_ZK_SESSION_TIMEOUT}" "hbase-site.xml"
loadConfigWithOption "hbase.master" ${HBASE_MASTER_HOSTNAME} "${HBASE_MASTER_HOSTNAME}:${HBASE_MASTER_PORT}" "${HOSTNAME}:${HBASE_MASTER_PORT}" "hbase-site.xml"
loadConfigWithOption "hbase.zookeeper.quorum" ${HBASE_ZK_QUORUM} "${HBASE_ZK_QUORUM}" "${HOSTNAME}" "hbase-site.xml"
loadConfigWithOption "hbase.root.dir" ${FS_HOSTNAME} "${FS_DEFAULTFS_PREFIX}${FS_HOSTNAME}:${FS_DEFAULTFS_PORT}${HBASE_ROOT_DIR}" "${FS_DEFAULTFS_PREFIX}${HOSTNAME}:${FS_DEFAULTFS_PORT}${HBASE_ROOT_DIR}" "hbase-site.xml"
echo "</configuration>" >> ${HBASE_CONF_DIR}/hbase-site.xml