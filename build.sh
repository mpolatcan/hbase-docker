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

DISTS=(
    "alpine"
    "ubuntu"
)

# $1: DIST
# $2: HBASE_VERSION
# $3: HADOOP_VERSION
function build_image() {
    sudo docker build -q -t mpolatcan/hbase:$1-$2-hadoop-$3 --build-arg HBASE_VERSION=$2 --build-arg HADOOP_VERSION=$3 ./$1/
	sudo docker push mpolatcan/hbase:$1-$2-hadoop-$3
	sudo docker rmi mpolatcan/hbase:$1-$2-hadoop-$3
}

for HBASE_VERSION in ${HBASE_VERSIONS[@]}; do
    for HADOOP_VERSION in ${HADOOP_VERSIONS[@]}; do
        for DIST in ${DISTS[@]}; do
            build_image $DIST $HBASE_VERSION $HADOOP_VERSION
        done
    done
done