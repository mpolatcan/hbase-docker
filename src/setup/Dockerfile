ARG JAVA_VERSION=""

FROM mpolatcan/hbase:base-java${JAVA_VERSION}

ARG HBASE_VERSION=""
ARG HBASE_DOWNLOAD_LINK="http://www-eu.apache.org/dist/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz"

RUN wget ${HBASE_DOWNLOAD_LINK} && \
    tar -xvzf hbase-${HBASE_VERSION}-bin.tar.gz -C ${HDUSER_HOME} && \
    mv ${HDUSER_HOME}/hbase-${HBASE_VERSION}/* ${HBASE_HOME} && \
    chown -R hduser:hadoop ${HDUSER_HOME} && \
    rm -r ${HDUSER_HOME}/hbase-${HBASE_VERSION} && \
    rm hbase-${HBASE_VERSION}-bin.tar.gz

USER hduser
WORKDIR ${HDUSER_HOME}
ENTRYPOINT ["./hbase_entrypoint.sh"]