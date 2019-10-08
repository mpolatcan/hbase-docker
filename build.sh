#!/bin/bash
HADOOP_VERSIONS=(
    "3.2.1"
    "3.1.2"
    "2.9.2"
    "2.8.5"
    "2.7.7"
)

HBASE_VERSIONS=(
    "2.2.1"
    "2.1.6"
    "1.4.10"
    "1.3.5"
)

JAVA_VERSIONS=(
    "8"
    "9"
    "10"
    "11"
    "12"
)

# $1: HBASE_VERSION
# $2: HADOOP_VERSION
# $3: JAVA_VERSION
function build_image() {
  sudo docker build -q -t mpolatcan/hbase:$1-hadoop-$2-java$3 --build-arg HBASE_VERSION=$1 --build-arg HADOOP_VERSION=$2 --build-arg JAVA_VERSION=$3 ./src/
	sudo docker push mpolatcan/hbase:$1-hadoop-$2-java$3
	sudo docker rmi mpolatcan/hbase:$1-hadoop-$2-java$3
}

for HBASE_VERSION in ${HBASE_VERSIONS[@]}; do
    for HADOOP_VERSION in ${HADOOP_VERSIONS[@]}; do
        for JAVA_VERSION in ${JAVA_VERSIONS[@]}; do
            build_image $HBASE_VERSION $HADOOP_VERSION $JAVA_VERSION
        done
    done
done