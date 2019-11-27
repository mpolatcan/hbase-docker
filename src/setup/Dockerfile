ARG JAVA_VERSION=""

FROM mpolatcan/hbase:base-java${JAVA_VERSION}

ARG HBASE_VERSION=""
ARG PHOENIX_VERSION=""
ARG PHOENIX_HBASE_VERSION=""
ARG HBASE_DOWNLOAD_LINK="http://www-eu.apache.org/dist/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz"
ARG PHOENIX_DOWNLOAD_LINK="http://www-eu.apache.org/dist/phoenix/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}/bin/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin.tar.gz"

RUN wget ${HBASE_DOWNLOAD_LINK} && \
    wget ${PHOENIX_DOWNLOAD_LINK} && \
    tar -xvzf hbase-${HBASE_VERSION}-bin.tar.gz -C ${HDUSER_HOME} && \
    tar -xvzf apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin.tar.gz -C ${HDUSER_HOME} && \
    mv ${HDUSER_HOME}/hbase-${HBASE_VERSION}/* ${HBASE_HOME} && \
    mv ${HDUSER_HOME}/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin/* ${PHOENIX_HOME} && \
    cp ${PHOENIX_HOME}/phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-server.jar ${HBASE_HOME}/lib && \
    mv ${HADOOP_LIBS_HOME}/tmp_jar/* ${HBASE_HOME}/lib && \
    rm -r ${HADOOP_LIBS_HOME}/tmp_jar && \
    chown -R hduser:hadoop ${HDUSER_HOME} && \
    rm -r ${HDUSER_HOME}/hbase-${HBASE_VERSION} && \
    rm -r ${HDUSER_HOME}/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin && \
    rm hbase-${HBASE_VERSION}-bin.tar.gz && \
    rm apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin.tar.gz

USER hduser
WORKDIR ${HDUSER_HOME}
ENTRYPOINT ["./hbase_entrypoint.sh"]