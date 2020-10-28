ARG JAVA_VERSION=""
ARG HADOOP_VERSION=""
FROM mpolatcan/hbase:base-hadoop-${HADOOP_VERSION}-java${JAVA_VERSION}

ARG HBASE_VERSION=""
ARG PHOENIX_VERSION=""
ARG PHOENIX_HBASE_VERSION=""
ARG HBASE_DOWNLOAD_LINK="http://downloads.apache.org/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz"
ARG PHOENIX_DOWNLOAD_LINK="http://downloads.apache.org/phoenix/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}/bin/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin.tar.gz"

RUN wget ${HBASE_DOWNLOAD_LINK} ${PHOENIX_DOWNLOAD_LINK} && \
    tar -xvzf hbase-${HBASE_VERSION}-bin.tar.gz -C ${HDUSER_HOME} && \
    tar -xvzf apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin.tar.gz -C ${HDUSER_HOME} && \
    mv ${HDUSER_HOME}/hbase-${HBASE_VERSION}/* ${HBASE_HOME} && \
    mv ${HDUSER_HOME}/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin/* ${PHOENIX_HOME} && \
    cp ${PHOENIX_HOME}/phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-server.jar ${HBASE_HOME}/lib && \
    mv htrace-core-3.2.0-incubating.jar ${HBASE_HOME}/lib && \
    rm ${HBASE_HOME}/lib/hadoop-*.jar && \
    cp ${HADOOP_HOME}/share/hadoop/common/hadoop-*.jar ${HBASE_HOME}/lib && \
    cp ${HADOOP_HOME}/share/hadoop/common/lib/hadoop-*.jar ${HBASE_HOME}/lib && \
    cp ${HADOOP_HOME}/share/hadoop/hdfs/hadoop-*.jar ${HBASE_HOME}/lib && \
    cp ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-*.jar ${HBASE_HOME}/lib && \
    cp ${HADOOP_HOME}/share/hadoop/mapreduce/lib/hadoop-*.jar ${HBASE_HOME}/lib && \
    cp ${HADOOP_HOME}/share/hadoop/yarn/hadoop-*.jar ${HBASE_HOME}/lib && \
    chown -R hduser:hadoop ${HDUSER_HOME} && \
    rm -r ${HDUSER_HOME}/hbase-${HBASE_VERSION} ${HDUSER_HOME}/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin && \
    rm hbase-${HBASE_VERSION}-bin.tar.gz apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin.tar.gz

USER hduser
WORKDIR ${HDUSER_HOME}
ENTRYPOINT ["./hbase_entrypoint.sh"]