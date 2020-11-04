ARG JAVA_VERSION=""
ARG HADOOP_VERSION=""

FROM mpolatcan/hbase:base-hadoop-${HADOOP_VERSION}-java${JAVA_VERSION}

MAINTAINER Mutlu Polatcan <mutlupolatcan@gmail.com>

ARG HBASE_VERSION=""
ARG PHOENIX_VERSION=""
ARG PHOENIX_HBASE_VERSION=""
ARG HBASE_ZIP_FOLDER_NAME="hbase-${HBASE_VERSION}-bin"
ARG HBASE_DOWNLOAD_LINK="http://downloads.apache.org/hbase/${HBASE_VERSION}/${HBASE_ZIP_FOLDER_NAME}.tar.gz"
ARG PHOENIX_ZIP_FOLDER_NAME="apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-bin"
ARG PHOENIX_DOWNLOAD_LINK="http://downloads.apache.org/phoenix/apache-phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}/bin/${PHOENIX_ZIP_FOLDER_NAME}.tar.gz"

RUN wget ${HBASE_DOWNLOAD_LINK} ${PHOENIX_DOWNLOAD_LINK} && \
    tar -xvzf ${HBASE_ZIP_FOLDER_NAME}.tar.gz && \
    tar -xvzf ${PHOENIX_ZIP_FOLDER_NAME}.tar.gz && \
    mv hbase-${HBASE_VERSION}/* ${HBASE_HOME} && \
    mv ${PHOENIX_ZIP_FOLDER_NAME}/* ${PHOENIX_HOME} && \
    cp ${PHOENIX_HOME}/phoenix-${PHOENIX_VERSION}-HBase-${PHOENIX_HBASE_VERSION}-server.jar ${HBASE_HOME}/lib && \
    mv htrace-core-3.2.0-incubating.jar ${HBASE_HOME}/lib && \
    rm ${HBASE_HOME}/lib/hadoop-*.jar && \
    cp ${HADOOP_HOME}/share/hadoop/common/hadoop-*.jar ${HBASE_HOME}/lib && \
    cp ${HADOOP_HOME}/share/hadoop/common/lib/hadoop-*.jar ${HBASE_HOME}/lib && \
    cp ${HADOOP_HOME}/share/hadoop/hdfs/hadoop-*.jar ${HBASE_HOME}/lib && \
    cp ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-*.jar ${HBASE_HOME}/lib && \
    cp ${HADOOP_HOME}/share/hadoop/yarn/hadoop-*.jar ${HBASE_HOME}/lib && \
    chown -R hduser:hadoop ${HDUSER_HOME} && \
    rm -r hbase-${HBASE_VERSION} \
          ${PHOENIX_ZIP_FOLDER_NAME} \
          ${HBASE_ZIP_FOLDER_NAME}.tar.gz \
          ${PHOENIX_ZIP_FOLDER_NAME}.tar.gz

USER hduser
ENTRYPOINT ["./hbase_entrypoint.sh", "hbase"]