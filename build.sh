#!/bin/bash
HADOOP_VERSIONS=(
    "3.2.0"
    "3.1.2"
    "3.1.1"
    "3.0.3"
    "3.0.2"
    "2.9.1"
    "2.9.0"
    "2.8.4"
    "2.7.6"
    "2.6.5"
)

HBASE_VERSIONS=(
    "2.2.0"
    "2.1.5"
    "2.0.5"
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
	sudo docker rmi $(sudo docker images -q)
}

for HBASE_VERSION in ${HBASE_VERSIONS[@]}; do
    for HADOOP_VERSION in ${HADOOP_VERSIONS[@]}; do
        for DIST in ${DISTS[@]}; do
            build_image $DIST $HBASE_VERSION $HADOOP_VERSION
        done
    done
done