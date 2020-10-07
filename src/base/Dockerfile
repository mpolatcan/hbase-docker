ARG HADOOP_VERSION=""

FROM mpolatcan/hadoop:${HADOOP_VERSION}-java8

MAINTAINER Mutlu Polatcan <mutlupolatcan@gmail.com>

ARG HTRACE_DOWNLOAD_LINK="https://repo1.maven.org/maven2/org/apache/htrace/htrace-core/3.2.0-incubating/htrace-core-3.2.0-incubating.jar"

ENV HDUSER_HOME "/home/hduser"
ENV HBASE_HOME="${HDUSER_HOME}/hbase" \
    PHOENIX_HOME="${HDUSER_HOME}/phoenix" \
    EXT_LIBS_HOME="${HDUSER_HOME}/ext_libs"
ENV HBASE_CONF_DIR="${HBASE_HOME}/conf" \
    PATH=$PATH:${HBASE_HOME}/bin:${PHOENIX_HOME}/bin \
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${EXT_LIBS_HOME}/hadoop_native_libs \
    HBASE_DAEMONS="NULL" \
    HBASE_MANAGES_ZK="false" \
    HBASE_HEAP_SIZE="NULL" \
    HBASE_OFFHEAP_SIZE="NULL" \
    DFS_NAMENODE_CONN_RETRY_INTERVAL="5"

ADD entrypoint.sh ${HDUSER_HOME}/hbase_entrypoint.sh
ADD config_loader.sh ${HDUSER_HOME}/hbase_config_loader.sh

USER root
RUN apt-get update && \
    apt-get -y install --no-install-recommends procps \
                                               nano \
                                               wget \
                                               rsync \
                                               gcc \
                                               g++ \
                                               unzip \
                                               iputils-ping \
                                               telnet \
                                               netcat \
                                               net-tools \
                                               python && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p ${HBASE_HOME} ${PHOENIX_HOME} ${EXT_LIBS_HOME} ${EXT_LIBS_HOME}/hadoop_native_libs ${EXT_LIBS_HOME}/htrace && \
    wget ${HADOOP_DOWNLOAD_LINK} ${HTRACE_DOWNLOAD_LINK} && \
    tar -xvzf hadoop-${HADOOP_VERSION}.tar.gz -C ${HDUSER_HOME} && \
    mv ${HDUSER_HOME}/hadoop-${HADOOP_VERSION}/lib/native/* ${EXT_LIBS_HOME}/hadoop_native_libs && \
    mv htrace-core-3.2.0-incubating.jar ${EXT_LIBS_HOME}/htrace && \
    rm -r hadoop-${HADOOP_VERSION}.tar.gz ${HDUSER_HOME}/hadoop-${HADOOP_VERSION} && \
    chown -R hduser:hadoop ${HDUSER_HOME} && \
    chmod +x ${HDUSER_HOME}/hbase_entrypoint.sh ${HDUSER_HOME}/hbase_config_loader.sh
