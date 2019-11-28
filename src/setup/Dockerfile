ARG JAVA_VERSION=""

FROM mpolatcan/hbase:base-java${JAVA_VERSION}

ARG HBASE_VERSION=""
ARG PHOENIX_VERSION=""
ARG PHOENIX_HBASE_VERSION=""
ARG HBASE_DOWNLOAD_LINK="http://www-eu.apache.org/dist/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz"
ARG PHOENIX_DOWNLOAD_LINK="http://www-eu.apache.org/dist/phoenix/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}/bin/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin.tar.gz"

# Download HBase and Phoenix packages
RUN wget ${HBASE_DOWNLOAD_LINK} ${PHOENIX_DOWNLOAD_LINK} && \
    # Extract HBase and Phoenix packages
    tar -xvzf hbase-${HBASE_VERSION}-bin.tar.gz -C ${HDUSER_HOME} && \
    tar -xvzf apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin.tar.gz -C ${HDUSER_HOME} && \
    # Move HBase and Phoenix packages's contents to their predefined folders
    mv ${HDUSER_HOME}/hbase-${HBASE_VERSION}/* ${HBASE_HOME} && \
    mv ${HDUSER_HOME}/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin/* ${PHOENIX_HOME} && \
    # Move HTrace and Phoenix server libraries to HBase's lib folder
    cp ${PHOENIX_HOME}/phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-server.jar ${HBASE_HOME}/lib && \
    mv ${EXT_LIBS_HOME}/htrace/*.jar ${HBASE_HOME}/lib && \
    # Update recursively hduser's folders
    chown -R hduser:hadoop ${HDUSER_HOME} && \
    # Remove unnecessary folders and packages
    rm -r ${HDUSER_HOME}/hbase-${HBASE_VERSION} ${HDUSER_HOME}/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin && \
    rm hbase-${HBASE_VERSION}-bin.tar.gz apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin.tar.gz

USER hduser
WORKDIR ${HDUSER_HOME}
ENTRYPOINT ["./hbase_entrypoint.sh"]