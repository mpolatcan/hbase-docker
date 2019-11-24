#!/usr/bin/env bash

function load_config() {
    if [[ "$2" != "NULL" ]]
        then
            printf "\t<property>\n\t\t<name>$1</name>\n\t\t<value>$2</value>\n\t</property>\n" >> "${HBASE_CONF_DIR}/$3"
    fi
}

function load_config_with_opt() {
    if [[ "$2" != "NULL" ]]
        then
            printf "\t<property>\n\t\t<name>$1</name>\n\t\t<value>$3</value>\n\t</property>\n" >> "${HBASE_CONF_DIR}/$5"
    else
        printf "\t<property>\n\t\t<name>$1</name>\n\t\t<value>$4</value>\n\t</property>\n" >> "${HBASE_CONF_DIR}/$5"
    fi
}

printf "<configuration>\n" > "${HBASE_CONF_DIR}/hbase-site.xml"
load_config "hbase.tmp.dir" "${HBASE_HOME}/tmp" "hbase-site.xml"
load_config "hbase.rootdir" "${FS_PREFIX}${DFS_NAMENODE_HOSTNAME}:${DFS_NAMENODE_RPC_PORT}" "hbase-site.xml"
load_config "hbase.rootdir.perms" "${HBASE_ROOTDIR_PERMS}" "hbase-site.xml"
load_config "hbase.cluster.distributed" "${HBASE_CLUSTER_DISTRIBUTED}" "hbase-site.xml"
load_config "hbase.zookeeper.quorum" "${HBASE_ZOOKEEPER_QUORUM}" "hbase-site.xml"
load_config "hbase.zookeeper.recovery.retry.maxsleeptime" "${HBASE_ZOOKEEPER_RECOVERY_RETRY_MAXSLEEPTIME}" "hbase-site.xml"
load_config "hbase.zookeeper.dns.interface" "${HBASE_ZOOKEEPER_DNS_INTERFACE}" "hbase-site.xml"
load_config "hbase.zookeeper.dns.nameserver" "${HBASE_ZOOKEEPER_DNS_NAMESERVER}" "hbase-site.xml"
load_config "hbase.zookeeper.peerport" "${HBASE_ZOOKEEPER_PEERPORT}" "hbase-site.xml"
load_config "hbase.zookeeper.leaderport" "${HBASE_ZOOKEEPER_LEADERPORT}" "hbase-site.xml"
load_config "hbase.zookeeper.property.initLimit" "${HBASE_ZOOKEEPER_PROPERTY_INITLIMIT}" "hbase-site.xml"
load_config "hbase.zookeeper.property.syncLimit" "${HBASE_ZOOKEEPER_PROPERTY_SYNCLIMIT}" "hbase-site.xml"
load_config "hbase.zookeeper.property.dataDir" "${HBASE_HOME}/zookeeper" "hbase-site.xml"
load_config "hbase.zookeeper.property.clientPort" "${HBASE_ZOOKEEPER_PROPERTY_CLIENTPORT}" "hbase-site.xml"
load_config "hbase.zookeeper.property.maxClientCnxns" "${HBASE_ZOOKEEPER_PROPERTY_MAXCLIENTCNXNS}" "hbase-site.xml"
load_config "hbase.local.dir" "${HBASE_HOME}/local" "hbase-site.xml"
load_config_with_opt "hbase.master" "${HBASE_MASTER_HOSTNAME}" "${HBASE_MASTER_HOSTNAME}:${HBASE_MASTER_PORT}" "${HOSTNAME}:${HBASE_MASTER_PORT}" "hbase-site.xml"
load_config "hbase.master.hostname" "${HBASE_MASTER_HOSTNAME}" "hbase-site.xml"
load_config "hbase.master.port" "${HBASE_MASTER_PORT}" "hbase-site.xml"
load_config "hbase.master.info.port" "${HBASE_MASTER_INFO_PORT}" "hbase-site.xml"
load_config "hbase.master.info.bindAddress" "${HBASE_MASTER_INFO_BINDADDRESS}" "hbase-site.xml"
load_config "hbase.master.logcleaner.plugins" "${HBASE_MASTER_LOGCLEANER_PLUGINS}" "hbase-site.xml"
load_config "hbase.master.logcleaner.ttl" "${HBASE_MASTER_LOGCLEANER_TTL}" "hbase-site.xml"
load_config "hbase.master.procedurewalcleaner.ttl" "${HBASE_MASTER_PROCEDUREWALCLEANER_TTL}" "hbase-site.xml"
load_config "hbase.master.hfilecleaner.plugins" "${HBASE_MASTER_HFILECLEANER_PLUGINS}" "hbase-site.xml"
load_config "hbase.master.infoserver.redirect" "${HBASE_MASTER_INFOSERVER_REDIRECT}" "hbase-site.xml"
load_config "hbase.master.fileSplitTimeout" "${HBASE_MASTER_FILESPLITTIMEOUT}" "hbase-site.xml"
load_config "hbase.master.balancer.maxRitPercent" "${HBASE_MASTER_BALANCER_MAXRITPERCENT}" "hbase-site.xml"
load_config "hbase.master.keytab.file" "${HBASE_MASTER_KEYTAB_FILE}" "hbase-site.xml"
load_config "hbase.master.kerberos.principal" "${HBASE_MASTER_KERBEROS_PRINCIPAL}" "hbase-site.xml"
load_config "hbase.master.loadbalancer.class" "${HBASE_MASTER_LOADBALANCER_CLASS}" "hbase-site.xml"
load_config "hbase.master.loadbalance.bytable" "${HBASE_MASTER_LOADBALANCE_BYTABLE}" "hbase-site.xml"
load_config "hbase.master.normalizer.class" "${HBASE_MASTER_NORMALIZER_CLASS}" "hbase-site.xml"
load_config "hbase.master.mob.ttl.cleaner.period" "${HBASE_MASTER_MOB_TTL_CLEANER_PERIOD}" "hbase-site.xml"
load_config "hbase.master.wait.on.service.seconds" "${HBASE_MASTER_WAIT_ON_SERVICE_SECONDS}" "hbase-site.xml"
load_config "hbase.master.cleaner.snapshot.interval" "${HBASE_MASTER_CLEANER_SNAPSHOT_INTERVAL}" "hbase-site.xml"
load_config "hbase.master.snapshot.ttl" "${HBASE_MASTER_SNAPSHOT_TTL}" "hbase-site.xml"
load_config "hbase.master.regions.recovery.check.interval" "${HBASE_MASTER_REGIONS_RECOVERY_CHECK_INTERVAL}" "hbase-site.xml"
load_config_with_opt "hbase.regionserver.hostname" "${HBASE_REGIONSERVER_HOSTNAME}" "${HBASE_REGIONSERVER_HOSTNAME}" "${HOSTNAME}" "hbase-site.xml"
load_config "hbase.regionserver.hostname.disable.master.reversedns" "${HBASE_REGIONSERVER_HOSTNAME_DISABLE_MASTER_REVERSEDNS}" "hbase-site.xml"
load_config "hbase.regionserver.port" "${HBASE_REGIONSERVER_PORT}" "hbase-site.xml"
load_config "hbase.regionserver.info.port" "${HBASE_REGIONSERVER_INFO_PORT}" "hbase-site.xml"
load_config "hbase.regionserver.info.port.auto" "${HBASE_REGIONSERVER_INFO_PORT_AUTO}" "hbase-site.xml"
load_config "hbase.regionserver.info.bindAddress" "${HBASE_REGIONSERVER_INFO_BINDADDRESS}" "hbase-site.xml"
load_config "hbase.regionserver.handler.count" "${HBASE_REGIONSERVER_HANDLER_COUNT}" "hbase-site.xml"
load_config "hbase.regionserver.handler.abort.on.error.percent" "${HBASE_REGIONSERVER_HANDLER_ABORT_ON_ERROR_PERCENT}" "hbase-site.xml"
load_config "hbase.regionserver.msginterval" "${HBASE_REGIONSERVER_MSGINTERVAL}" "hbase-site.xml"
load_config "hbase.regionserver.logroll.period" "${HBASE_REGIONSERVER_LOGROLL_PERIOD}" "hbase-site.xml"
load_config "hbase.regionserver.logroll.errors.tolerated" "${HBASE_REGIONSERVER_LOGROLL_ERRORS_TOLERATED}" "hbase-site.xml"
load_config "hbase.regionserver.hlog.reader.impl" "${HBASE_REGIONSERVER_HLOG_READER_IMPL}" "hbase-site.xml"
load_config "hbase.regionserver.hlog.writer.impl" "${HBASE_REGIONSERVER_HLOG_WRITER_IMPL}" "hbase-site.xml"
load_config "hbase.regionserver.global.memstore.size" "${HBASE_REGIONSERVER_GLOBAL_MEMSTORE_SIZE}" "hbase-site.xml"
load_config "hbase.regionserver.global.memstore.size.lower.limit" "${HBASE_REGIONSERVER_GLOBAL_MEMSTORE_SIZE_LOWER_LIMIT}" "hbase-site.xml"
load_config "hbase.regionserver.optionalcacheflushinterval" "${HBASE_REGIONSERVER_OPTIONALCACHEFLUSHINTERVAL}" "hbase-site.xml"
load_config "hbase.regionserver.dns.interface" "${HBASE_REGIONSERVER_DNS_INTERFACE}" "hbase-site.xml"
load_config "hbase.regionserver.dns.nameserver" "${HBASE_REGIONSERVER_DNS_NAMESERVER}" "hbase-site.xml"
load_config "hbase.regionserver.region.split.policy" "${HBASE_REGIONSERVER_REGION_SPLIT_POLICY}" "hbase-site.xml"
load_config "hbase.regionserver.regionSplitLimit" "${HBASE_REGIONSERVER_REGIONSPLITLIMIT}" "hbase-site.xml"
load_config "hbase.regionserver.flush.check.period" "${HBASE_SERVER_THREAD_WAKEFREQUENCY}" "hbase-site.xml"
load_config "hbase.regionserver.compaction.check.period" "${HBASE_SERVER_THREAD_WAKEFREQUENCY}" "hbase-site.xml"
load_config "hbase.regionserver.compaction.enabled" "${HBASE_REGIONSERVER_COMPACTION_ENABLED}" "hbase-site.xml"
load_config "hbase.regionserver.offheap.global.memstore.size" "${HBASE_REGIONSERVER_OFFHEAP_GLOBAL_MEMSTORE_SIZE}" "hbase-site.xml"
load_config "hbase.regionserver.thread.compaction.throttle" "${HBASE_REGIONSERVER_THREAD_COMPACTION_THROTTLE}" "hbase-site.xml"
load_config "hbase.regionserver.majorcompaction.pagecache.drop" "${HBASE_REGIONSERVER_MAJORCOMPACTION_PAGECACHE_DROP}" "hbase-site.xml"
load_config "hbase.regionserver.minorcompaction.pagecache.drop" "${HBASE_REGIONSERVER_MINORCOMPACTION_PAGECACHE_DROP}" "hbase-site.xml"
load_config "hbase.regionserver.keytab.file" "${HBASE_REGIONSERVER_KEYTAB_FILE}" "hbase-site.xml"
load_config "hbase.regionserver.kerberos.principal" "${HBASE_REGIONSERVER_KERBEROS_PRINCIPAL}" "hbase-site.xml"
load_config "hbase.regionserver.thrift.framed" "${HBASE_REGIONSERVER_THRIFT_FRAMED}" "hbase-site.xml"
load_config "hbase.regionserver.thrift.framed.max_frame_size_in_mb" "${HBASE_REGIONSERVER_THRIFT_FRAMED_MAX_FRAME_SIZE_IN_MB}" "hbase-site.xml"
load_config "hbase.regionserver.thrift.compact" "${HBASE_REGIONSERVER_THRIFT_COMPACT}" "hbase-site.xml"
load_config "hbase.regionserver.checksum.verify" "${HBASE_REGIONSERVER_CHECKSUM_VERIFY}" "hbase-site.xml"
load_config "hbase.regionserver.storefile.refresh.period" "${HBASE_REGIONSERVER_STOREFILE_REFRESH_PERIOD}" "hbase-site.xml"
load_config "hbase.ipc.server.callqueue.handler.factor" "${HBASE_IPC_SERVER_CALLQUEUE_HANDLER_FACTOR}" "hbase-site.xml"
load_config "hbase.ipc.server.callqueue.read.ratio" "${HBASE_IPC_SERVER_CALLQUEUE_READ_RATIO}" "hbase-site.xml"
load_config "hbase.ipc.server.callqueue.scan.ratio" "${HBASE_IPC_SERVER_CALLQUEUE_SCAN_RATIO}" "hbase-site.xml"
load_config "hbase.ipc.server.fallback-to-simple-auth-allowed" "${HBASE_IPC_SERVER_FALLBACK_TO_SIMPLE_AUTH_ALLOWED}" "hbase-site.xml"
load_config "hbase.ipc.client.tcpnodelay" "${HBASE_IPC_CLIENT_TCPNODELAY}" "hbase-site.xml"
load_config "hbase.ipc.client.fallback-to-simple-auth-allowed" "${HBASE_IPC_CLIENT_FALLBACK_TO_SIMPLE_AUTH_ALLOWED}" "hbase-site.xml"
load_config "hbase.systemtables.compacting.memstore.type" "${HBASE_SYSTEMTABLES_COMPACTING_MEMSTORE_TYPE}" "hbase-site.xml"
load_config "hbase.client.write.buffer" "${HBASE_CLIENT_WRITE_BUFFER}" "hbase-site.xml"
load_config "hbase.client.pause" "${HBASE_CLIENT_PAUSE}" "hbase-site.xml"
load_config "hbase.client.pause.cqtbe" "${HBASE_CLIENT_PAUSE_CQTBE}" "hbase-site.xml"
load_config "hbase.client.retries.number" "${HBASE_CLIENT_RETRIES_NUMBER}" "hbase-site.xml"
load_config "hbase.client.max.total.tasks" "${HBASE_CLIENT_MAX_TOTAL_TASKS}" "hbase-site.xml"
load_config "hbase.client.max.perserver.tasks" "${HBASE_CLIENT_MAX_PERSERVER_TASKS}" "hbase-site.xml"
load_config "hbase.client.max.perregion.tasks" "${HBASE_CLIENT_MAX_PERREGION_TASKS}" "hbase-site.xml"
load_config "hbase.client.perserver.requests.threshold" "${HBASE_CLIENT_PERSERVER_REQUESTS_THRESHOLD}" "hbase-site.xml"
load_config "hbase.client.scanner.caching" "${HBASE_CLIENT_SCANNER_CACHING}" "hbase-site.xml"
load_config "hbase.client.scanner.timeout.period" "${HBASE_CLIENT_SCANNER_TIMEOUT_PERIOD}" "hbase-site.xml"
load_config "hbase.client.scanner.max.result.size" "${HBASE_CLIENT_SCANNER_MAX_RESULT_SIZE}" "hbase-site.xml"
load_config "hbase.client.keyvalue.maxsize" "${HBASE_CLIENT_KEYVALUE_MAXSIZE}" "hbase-site.xml"
load_config "hbase.client.localityCheck.threadPoolSize" "${HBASE_CLIENT_LOCALITYCHECK_THREADPOOLSIZE}" "hbase-site.xml"
load_config "hbase.client.operation.timeout" "${HBASE_CLIENT_OPERATION_TIMEOUT}" "hbase-site.xml"
load_config "hbase.server.keyvalue.maxsize" "${HBASE_SERVER_KEYVALUE_MAXSIZE}" "hbase-site.xml"
load_config "hbase.server.thread.wakefrequency" "${HBASE_SERVER_THREAD_WAKEFREQUENCY}" "hbase-site.xml"
load_config "hbase.server.versionfile.writeattempts" "${HBASE_SERVER_VERSIONFILE_WRITEATTEMPTS}" "hbase-site.xml"
load_config "hbase.server.compactchecker.interval.multiplier" "${HBASE_SERVER_COMPACTCHECKER_INTERVAL_MULTIPLIER}" "hbase-site.xml"
load_config "hbase.server.scanner.max.result.size" "${HBASE_SERVER_SCANNER_MAX_RESULT_SIZE}" "hbase-site.xml"
load_config "hbase.bulkload.retries.number" "${HBASE_BULKLOAD_RETRIES_NUMBER}" "hbase-site.xml"
load_config "hbase.balancer.period" "${HBASE_BALANCER_PERIOD}" "hbase-site.xml"
load_config "hbase.normalizer.period" "${HBASE_NORMALIZER_PERIOD}" "hbase-site.xml"
load_config "hbase.normalizer.min.region.count" "${HBASE_NORMALIZER_MIN_REGION_COUNT}" "hbase-site.xml"
load_config "hbase.regions.slop" "${HBASE_REGIONS_SLOP}" "hbase-site.xml"
load_config "hbase.regions.recovery.store.file.ref.count" "${HBASE_REGIONS_RECOVERY_STORE_FILE_REF_COUNT}" "hbase-site.xml"
load_config "hbase.hregion.memstore.flush.size" "${HBASE_HREGION_MEMSTORE_FLUSH_SIZE}" "hbase-site.xml"
load_config "hbase.hregion.memstore.block.multiplier" "${HBASE_HREGION_MEMSTORE_BLOCK_MULTIPLIER}" "hbase-site.xml"
load_config "hbase.hregion.memstore.mslab.enabled" "${HBASE_HREGION_MEMSTORE_MSLAB_ENABLED}" "hbase-site.xml"
load_config "hbase.hregion.memstore.mslab.chunksize" "${HBASE_HREGION_MEMSTORE_MSLAB_CHUNKSIZE}" "hbase-site.xml"
load_config "hbase.hregion.memstore.mslab.max.allocation" "${HBASE_HREGION_MEMSTORE_MSLAB_MAX_ALLOCATION}" "hbase-site.xml"
load_config "hbase.hregion.percolumnfamilyflush.size.lower.bound.min" "${HBASE_HREGION_PERCOLUMNFAMILYFLUSH_SIZE_LOWER_BOUND_MIN}" "hbase-site.xml"
load_config "hbase.hregion.preclose.flush.size" "${HBASE_HREGION_PRECLOSE_FLUSH_SIZE}" "hbase-site.xml"
load_config "hbase.hregion.max.filesize" "${HBASE_HREGION_MAX_FILESIZE}" "hbase-site.xml"
load_config "hbase.hregion.majorcompaction" "${HBASE_HREGION_MAJORCOMPACTION}" "hbase-site.xml"
load_config "hbase.hregion.majorcompaction.jitter" "${HBASE_HREGION_MAJORCOMPACTION_JITTER}" "hbase-site.xml"
load_config "hbase.hstore.compactionThreshold" "${HBASE_HSTORE_COMPACTIONTHRESHOLD}" "hbase-site.xml"
load_config "hbase.hstore.flusher.count" "${HBASE_HSTORE_FLUSHER_COUNT}" "hbase-site.xml"
load_config "hbase.hstore.blockingStoreFiles" "${HBASE_HSTORE_BLOCKINGSTOREFILES}" "hbase-site.xml"
load_config "hbase.hstore.blockingWaitTime" "${HBASE_HSTORE_BLOCKINGWAITTIME}" "hbase-site.xml"
load_config "hbase.hstore.compaction.min" "${HBASE_HSTORE_COMPACTION_MIN}" "hbase-site.xml"
load_config "hbase.hstore.compaction.min.size" "${HBASE_HSTORE_COMPACTION_MIN_SIZE}" "hbase-site.xml"
load_config "hbase.hstore.compaction.max" "${HBASE_HSTORE_COMPACTION_MAX}" "hbase-site.xml"
load_config "hbase.hstore.compaction.max.size" "${HBASE_HSTORE_COMPACTION_MAX_SIZE}" "hbase-site.xml"
load_config "hbase.hstore.compaction.ratio" "${HBASE_HSTORE_COMPACTION_RATIO}" "hbase-site.xml"
load_config "hbase.hstore.compaction.ratio.offpeak" "${HBASE_HSTORE_COMPACTION_RATIO_OFFPEAK}" "hbase-site.xml"
load_config "hbase.hstore.compaction.kv.max" "${HBASE_HSTORE_COMPACTION_KV_MAX}" "hbase-site.xml"
load_config "hbase.hstore.compaction.throughput.lower.bound" "${HBASE_HSTORE_COMPACTION_THROUGHPUT_LOWER_BOUND}" "hbase-site.xml"
load_config "hbase.hstore.compaction.throughput.higher.bound" "${HBASE_HSTORE_COMPACTION_THROUGHPUT_HIGHER_BOUND}" "hbase-site.xml"
load_config "hbase.hstore.time.to.purge.deletes" "${HBASE_HSTORE_TIME_TO_PURGE_DELETES}" "hbase-site.xml"
load_config "hbase.hstore.bytes.per.checksum" "${HBASE_HSTORE_BYTES_PER_CHECKSUM}" "hbase-site.xml"
load_config "hbase.hstore.checksum.algorithm" "${HBASE_HSTORE_CHECKSUM_ALGORITHM}" "hbase-site.xml"
load_config "hbase.offpeak.start.hour" "${HBASE_OFFPEAK_START_HOUR}" "hbase-site.xml"
load_config "hbase.offpeak.end.hoır" "${HBASE_OFFPEAK_END_HOIR}" "hbase-site.xml"
load_config "hbase.storescanner.parallel.seek.enable" "${HBASE_STORESCANNER_PARALLEL_SEEK_ENABLE}" "hbase-site.xml"
load_config "hbase.storescanner.parallel.seek.threads" "${HBASE_STORESCANNER_PARALLEL_SEEK_THREADS}" "hbase-site.xml"
load_config "hbase.bucketcache.ioengine" "${HBASE_BUCKETCACHE_IOENGINE}" "hbase-site.xml"
load_config "hbase.bucketcache.size" "${HBASE_BUCKETCACHE_SIZE}" "hbase-site.xml"
load_config "hbase.bucketcache.bucket.sizes" "${HBASE_BUCKETCACHE_BUCKET_SIZES}" "hbase-site.xml"
load_config "hbase.rs.cacheblocksonwrite" "${HBASE_RS_CACHEBLOCKSONWRITE}" "hbase-site.xml"
load_config "hbase.rpc.timeout" "${HBASE_RPC_TIMEOUT}" "hbase-site.xml"
load_config "hbase.rpc.shortoperation.timeout" "${HBASE_RPC_SHORTOPERATION_TIMEOUT}" "hbase-site.xml"
load_config "hbase.rpc.rows.warning.threshold" "${HBASE_RPC_ROWS_WARNING_THRESHOLD}" "hbase-site.xml"
load_config "hbase.cells.scanned.per.heartbeat.check" "${HBASE_CELLS_SCANNED_PER_HEARTBEAT_CHECK}" "hbase-site.xml"
load_config "hbase.superuser" "${HBASE_SUPERUSER}" "hbase-site.xml"
load_config "hbase.auth.key.update.interval" "${HBASE_AUTH_KEY_UPDATE_INTERVAL}" "hbase-site.xml"
load_config "hbase.auth.token.max.lifetime" "${HBASE_AUTH_TOKEN_MAX_LIFETIME}" "hbase-site.xml"
load_config "hbase.display.keys" "${HBASE_DISPLAY_KEYS}" "hbase-site.xml"
load_config "hbase.coprocessor.enabled" "${HBASE_COPROCESSOR_ENABLED}" "hbase-site.xml"
load_config "hbase.coprocessor.user.enabled" "${HBASE_COPROCESSOR_USER_ENABLED}" "hbase-site.xml"
load_config "hbase.coprocessor.region.classes" "${HBASE_COPROCESSOR_REGION_CLASSES}" "hbase-site.xml"
load_config "hbase.coprocessor.master.classses" "${HBASE_COPROCESSOR_MASTER_CLASSSES}" "hbase-site.xml"
load_config "hbase.coprocessor.abortonerror" "${HBASE_COPROCESSOR_ABORTONERROR}" "hbase-site.xml"
load_config "hbase.rest.port" "${HBASE_REST_PORT}" "hbase-site.xml"
load_config "hbase.rest.readonly" "${HBASE_REST_READONLY}" "hbase-site.xml"
load_config "hbase.rest.threads.max" "${HBASE_REST_THREADS_MAX}" "hbase-site.xml"
load_config "hbase.rest.threads.min" "${HBASE_REST_THREADS_MIN}" "hbase-site.xml"
load_config "hbase.rest.support.proxyuser" "${HBASE_REST_SUPPORT_PROXYUSER}" "hbase-site.xml"
load_config "hbase.rest.filter.classes" "${HBASE_REST_FILTER_CLASSES}" "hbase-site.xml"
load_config "hbase.rest.csrf.enabled" "${HBASE_REST_CSRF_ENABLED}" "hbase-site.xml"
load_config "hbase.defaults.for.version.skip" "${HBASE_DEFAULTS_FOR_VERSION_SKIP}" "hbase-site.xml"
load_config "hbase.table.lock.enable" "${HBASE_TABLE_LOCK_ENABLE}" "hbase-site.xml"
load_config "hbase.table.max.rowsize" "${HBASE_TABLE_MAX_ROWSIZE}" "hbase-site.xml"
load_config "hbase.thrift.minWorkerThreads" "${HBASE_THRIFT_MINWORKERTHREADS}" "hbase-site.xml"
load_config "hbase.thrift.maxWorkerThreads" "${HBASE_THRIFT_MAXWORKERTHREADS}" "hbase-site.xml"
load_config "hbase.thrift.maxQueuedRequests" "${HBASE_THRIFT_MAXQUEUEDREQUESTS}" "hbase-site.xml"
load_config "hbase.wal.dir.perms" "${HBASE_WAL_DIR_PERMS}" "hbase-site.xml"
load_config "hbase.data.umask" "${HBASE_DATA_UMASK}" "hbase-site.xml"
load_config "hbase.data.umask.enable" "${HBASE_DATA_UMASK_ENABLE}" "hbase-site.xml"
load_config "hbase.snapshot.enabled" "${HBASE_SNAPSHOT_ENABLED}" "hbase-site.xml"
load_config "hbase.snapshot.restore.take.failsafe.snapshot" "${HBASE_SNAPSHOT_RESTORE_TAKE_FAILSAFE_SNAPSHOT}" "hbase-site.xml"
load_config "hbase.snapshot.restore.failsafe.name" "${HBASE_SNAPSHOT_RESTORE_FAILSAFE_NAME}" "hbase-site.xml"
load_config "hbase.snapshot.working.dir" "${HBASE_SNAPSHOT_WORKING_DIR}" "hbase-site.xml"
load_config "hbase.snapshot.master.timeout.millis" "${HBASE_SNAPSHOT_MASTER_TIMEOUT_MILLIS}" "hbase-site.xml"
load_config "hbase.snapshot.region.timeout" "${HBASE_SNAPSHOT_REGION_TIMEOUT}" "hbase-site.xml"
load_config "hbase.lease.recovery.timeout" "${HBASE_LEASE_RECOVERY_TIMEOUT}" "hbase-site.xml"
load_config "hbase.lease.recovery.dfs.timeout" "${HBASE_LEASE_RECOVERY_DFS_TIMEOUT}" "hbase-site.xml"
load_config "hbase.column.max.version" "${HBASE_COLUMN_MAX_VERSION}" "hbase-site.xml"
load_config "hbase.dfs.client.read.shortcircuit.buffer.size" "${HBASE_DFS_CLIENT_READ_SHORTCIRCUIT_BUFFER_SIZE}" "hbase-site.xml"
load_config "hbase.status.published" "${HBASE_STATUS_PUBLISHED}" "hbase-site.xml"
load_config "hbase.status.publisher.class" "${HBASE_STATUS_PUBLISHER_CLASS}" "hbase-site.xml"
load_config "hbase.status.listener.class" "${HBASE_STATUS_LISTENER_CLASS}" "hbase-site.xml"
load_config "hbase.status.multicast.address.ip" "${HBASE_STATUS_MULTICAST_ADDRESS_IP}" "hbase-site.xml"
load_config "hbase.status.multicast.address.port" "${HBASE_STATUS_MULTICAST_ADDRESS_PORT}" "hbase-site.xml"
load_config "hbase.dynamic.jars.dir" "${HBASE_ROOTDIR}/lib" "hbase-site.xml"
load_config "hbase.security.authentication" "${HBASE_SECURITY_AUTHENTICATION}" "hbase-site.xml"
load_config "hbase.security.exec.permission.checks" "${HBASE_SECURITY_EXEC_PERMISSION_CHECKS}" "hbase-site.xml"
load_config "hbase.rest-csrf.browser-useragents-regex" "${HBASE_REST_CSRF_BROWSER_USERAGENTS_REGEX}" "hbase-site.xml"
load_config "hbase.rest-csrf.visibility.mutations.checkauths" "${HBASE_REST_CSRF_VISIBILITY_MUTATIONS_CHECKAUTHS}" "hbase-site.xml"
load_config "hbase.procedure.regionserver.classes" "${HBASE_PROCEDURE_REGIONSERVER_CLASSES}" "hbase-site.xml"
load_config "hbase.procedure.master.classes" "${HBASE_PROCEDURE_MASTER_CLASSES}" "hbase-site.xml"
load_config "hbase.coordinated.state.manager.class" "${HBASE_COORDINATED_STATE_MANAGER_CLASS}" "hbase-site.xml"
load_config "hbase.region.replica.replication.enabled" "${HBASE_REGION_REPLICA_REPLICATION_ENABLED}" "hbase-site.xml"
load_config "hbase.http.filter.initializers" "${HBASE_HTTP_FILTER_INITIALIZERS}" "hbase-site.xml"
load_config "hbase.http.max.threads" "${HBASE_HTTP_MAX_THREADS}" "hbase-site.xml"
load_config "hbase.http.staticuser.user" "${HBASE_HTTP_STATICUSER_USER}" "hbase-site.xml"
load_config "hbase.replication.rpc.codec" "${HBASE_REPLICATION_RPC_CODEC}" "hbase-site.xml"
load_config "hbase.replication.source.maxthreads" "${HBASE_REPLICATION_SOURCE_MAXTHREADS}" "hbase-site.xml"
load_config "hbase.mob.file.cache.size" "${HBASE_MOB_FILE_CACHE_SIZE}" "hbase-site.xml"
load_config "hbase.mob.cache.evict.period" "${HBASE_MOB_CACHE_EVICT_PERIOD}" "hbase-site.xml"
load_config "hbase.mob.cache.evict.remain.ratio" "${HBASE_MOB_CACHE_EVICT_REMAIN_RATIO}" "hbase-site.xml"
load_config "hbase.mob.compaction.mergeable.threshold" "${HBASE_MOB_COMPACTION_MERGEABLE_THRESHOLD}" "hbase-site.xml"
load_config "hbase.mob.compaction.batch.size" "${HBASE_MOB_COMPACTION_BATCH_SIZE}" "hbase-site.xml"
load_config "hbase.mob.compaction.chore.period" "${HBASE_MOB_COMPACTION_CHORE_PERIOD}" "hbase-site.xml"
load_config "hbase.mob.compaction.threads.max" "${HBASE_MOB_COMPACTION_THREADS_MAX}" "hbase-site.xml"
load_config "hbase.mob.delfile.max.count" "${HBASE_MOB_DELFILE_MAX_COUNT}" "hbase-site.xml"
load_config "hbase.mob.compactor.class" "${HBASE_MOB_COMPACTOR_CLASS}" "hbase-site.xml"
load_config "zookeeper.session.timeout" "${ZOOKEEPER_SESSION_TIMEOUT}" "hbase-site.xml"
load_config "zookeeper.znode.parent" "${ZOOKEEPER_ZNODE_PARENT}" "hbase-site.xml"
load_config "zookeeper.znode.acl.parent" "${ZOOKEEPER_ZNODE_ACL_PARENT}" "hbase-site.xml"
load_config "hfile.block.cache.policy" "${HFILE_BLOCK_CACHE_POLICY}" "hbase-site.xml"
load_config "hfile.block.cache.size" "${HFILE_BLOCK_CACHE_SIZE}" "hbase-site.xml"
load_config "hfile.block.index.cacheonwrite" "${HFILE_BLOCK_INDEX_CACHEONWRITE}" "hbase-site.xml"
load_config "hfile.block.bloom.cacheonwrite" "${HFILE_BLOCK_BLOOM_CACHEONWRITE}" "hbase-site.xml"
load_config "hfile.index.block.max.size" "${HFILE_INDEX_BLOCK_MAX_SIZE}" "hbase-site.xml"
load_config "hfile.format.version" "${HFILE_FORMAT_VERSION}" "hbase-site.xml"
load_config "io.storefile.bloom.block.size" "${IO_STOREFILE_BLOOM_BLOCK_SIZE}" "hbase-site.xml"
load_config "hadoop.policy.file" "${HADOOP_POLICY_FILE}" "hbase-site.xml"
load_config "dfs.namenode.hostname" "${DFS_NAMENODE_HOSTNAME}" "hbase-site.xml"
load_config "dfs.namenode.rpc-port" "${DFS_NAMENODE_RPC_PORT}" "hbase-site.xml"
load_config "dfs.client.read.shortcircuit" "${DFS_CLIENT_READ_SHORTCIRCUIT}" "hbase-site.xml"
load_config "dfs.domain.socket.path" "${DFS_DOMAIN_SOCKET_PATH}" "hbase-site.xml"
load_config "fs.prefix" "${FS_PREFIX}" "hbase-site.xml"
printf "</configuration>" >> "${HBASE_CONF_DIR}/hbase-site.xml"
