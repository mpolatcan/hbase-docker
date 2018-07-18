ARG HADOOP_VERSION=2.9.0

FROM mpolatcan/hadoop:alpine-${HADOOP_VERSION}

ARG HBASE_VERSION=2.0.0
ARG HBASE_DOWNLOAD_LINK="http://archive.apache.org/dist/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz"

# TODO Add new configurations

MAINTAINER Mutlu Polatcan <mutlupolatcan@gmail.com>

ENV HBASE_HOME "/usr/local/hbase"
ENV HBASE_CONF_DIR "/usr/local/hbase/conf"
ENV PATH $PATH:$HBASE_HOME/bin

########################################################################################################################
############################################### HBASE ENV VARIABLES ####################################################
########################################################################################################################
ENV HBASE_NODE_TYPE "master"
ENV HBASE_MASTER_HOSTNAME "NULL"
ENV HBASE_MASTER_PORT "16000"
ENV HBASE_MASTER_INFO_PORT "16010"
ENV HBASE_MASTER_INFO_BINDADDR "0.0.0.0"
ENV HBASE_MASTER_LOGCLEANER_TTL "600000"
ENV HBASE_MASTER_PROCEDUREWALCLEANER_TTL "604800000"
ENV HBASE_REGIONSERVER_PORT "16020"
ENV HBASE_REGIONSERVER_INFO_PORT "16020"
ENV HBASE_REGIONSERVER_INFO_BINDADDR "0.0.0.0"
ENV HBASE_REGIONSERVER_HANDLER_COUNT "30"
ENV HBASE_REGIONSERVER_REGIONSPLITLIMIT "1000"
ENV HBASE_ZK_SESSION_TIMEOUT "200000"
ENV HBASE_CLIENT_RETRIES_NUMBER "50"
ENV HBASE_ZK_RECOVERY_RETRY "50"
ENV HBASE_CLIENT_WRITE_BUFFER "2097152"
ENV HBASE_ROOT_DIR "/hbase"
ENV HBASE_ZK_QUORUM "NULL"
ENV HBASE_ZK_CLIENT_PORT "2181"
ENV HBASE_MANAGES_ZK "true"
ENV HBASE_CLUSTER_DISTRIBUTED "false"
########################################################################################################################

COPY entrypoint.sh hbase_config_loader.sh ./

RUN wget ${HBASE_DOWNLOAD_LINK} && \
    mkdir -p ${HBASE_HOME} && \
    tar -xvzf hbase-${HBASE_VERSION}-bin.tar.gz -C /usr/local && \
    mv /usr/local/hbase-${HBASE_VERSION}/* ${HBASE_HOME} && \
    rm -r /usr/local/hbase-${HBASE_VERSION} && \
    rm hbase-${HBASE_VERSION}-bin.tar.gz && \
    chown -R hduser:hadoop ${HBASE_HOME} && \
    chmod -R 777 ${HBASE_HOME} && \
    echo "export JAVA_HOME=${JAVA_HOME}" >> ${HBASE_CONF_DIR}/hbase-env.sh && \
    rm ${HBASE_HOME}/conf/regionservers && \
    chmod +x entrypoint.sh hbase_config_loader.sh

ENTRYPOINT ["./entrypoint.sh"]