ARG HADOOP_VERSION=""

FROM mpolatcan/hadoop:${HADOOP_VERSION}-java8

MAINTAINER Mutlu Polatcan <mutlupolatcan@gmail.com>

ARG HTRACE_DOWNLOAD_LINK="https://repo1.maven.org/maven2/org/apache/htrace/htrace-core/3.2.0-incubating/htrace-core-3.2.0-incubating.jar"

ENV HBASE_HOME="${HDUSER_HOME}/hbase" \
    PHOENIX_HOME="${HDUSER_HOME}/phoenix"
ENV HBASE_CONF_DIR="${HBASE_HOME}/conf" \
    PATH=$PATH:${HBASE_HOME}/bin:${PHOENIX_HOME}/bin \
    HBASE_DAEMONS="NULL"

ADD entrypoint.sh ./hbase_entrypoint.sh
ADD config_loader.sh ./hbase_config_loader.sh

USER root
RUN mkdir -p ${HBASE_HOME} ${PHOENIX_HOME} && \
    wget ${HTRACE_DOWNLOAD_LINK} && \
    chown -R hduser:hadoop ${HDUSER_HOME} && \
    chmod +x hbase_entrypoint.sh hbase_config_loader.sh
