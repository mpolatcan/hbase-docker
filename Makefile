.PHONY: publish-hbase
publish-hbase:
	sudo docker build -q -t mpolatcan/hbase:ubuntu-2.0.1-hadoop-3.1.0 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="3.1.0" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-2.0.1-hadoop-3.1.0
	sudo docker rmi mpolatcan/hbase:ubuntu-2.0.1-hadoop-3.1.0
	
	sudo docker build -q -t mpolatcan/hbase:alpine-2.0.1-hadoop-3.1.0 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="3.1.0" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-2.0.1-hadoop-3.1.0
	sudo docker rmi mpolatcan/hbase:alpine-2.0.1-hadoop-3.1.0
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-2.0.1-hadoop-3.0.3 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="3.0.3" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-2.0.1-hadoop-3.0.3
	sudo docker rmi mpolatcan/hbase:ubuntu-2.0.1-hadoop-3.0.3
	
	sudo docker build -q -t mpolatcan/hbase:alpine-2.0.1-hadoop-3.0.3 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="3.0.3" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-2.0.1-hadoop-3.0.3
	sudo docker rmi mpolatcan/hbase:alpine-2.0.1-hadoop-3.0.3
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-2.0.1-hadoop-3.0.2 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="3.0.2" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-2.0.1-hadoop-3.0.2
	sudo docker rmi mpolatcan/hbase:ubuntu-2.0.1-hadoop-3.0.2
	
	sudo docker build -q -t mpolatcan/hbase:alpine-2.0.1-hadoop-3.0.2 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="3.0.2" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-2.0.1-hadoop-3.0.2
	sudo docker rmi mpolatcan/hbase:alpine-2.0.1-hadoop-3.0.2
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.9.1 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="2.9.1" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.9.1
	sudo docker rmi mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.9.1
	
	sudo docker build -q -t mpolatcan/hbase:alpine-2.0.1-hadoop-2.9.1 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="2.9.1" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-2.0.1-hadoop-2.9.1
	sudo docker rmi mpolatcan/hbase:alpine-2.0.1-hadoop-2.9.1
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.9.0 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="2.9.0" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.9.0
	sudo docker rmi mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.9.0
	
	sudo docker build -q -t mpolatcan/hbase:alpine-2.0.1-hadoop-2.9.0 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="2.9.0" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-2.0.1-hadoop-2.9.0
	sudo docker rmi mpolatcan/hbase:alpine-2.0.1-hadoop-2.9.0
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.8.4 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="2.8.4" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.8.4
	sudo docker rmi mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.8.4
	
	sudo docker build -q -t mpolatcan/hbase:alpine-2.0.1-hadoop-2.8.4 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="2.8.4" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-2.0.1-hadoop-2.8.4
	sudo docker rmi mpolatcan/hbase:alpine-2.0.1-hadoop-2.8.4
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.7.6 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="2.7.6" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.7.6
	sudo docker rmi mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.7.6
	
	sudo docker build -q -t mpolatcan/hbase:alpine-2.0.1-hadoop-2.7.6 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="2.7.6" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-2.0.1-hadoop-2.7.6
	sudo docker rmi mpolatcan/hbase:alpine-2.0.1-hadoop-2.7.6
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.6.5 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="2.6.5" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.6.5
	sudo docker rmi mpolatcan/hbase:ubuntu-2.0.1-hadoop-2.6.5
	
	sudo docker build -q -t mpolatcan/hbase:alpine-2.0.1-hadoop-2.6.5 --build-arg HBASE_VERSION="2.0.1" --build-arg HADOOP_VERSION="2.6.5" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-2.0.1-hadoop-2.6.5
	sudo docker rmi mpolatcan/hbase:alpine-2.0.1-hadoop-2.6.5
# ----------------------------------------------------------------------------------------------------------------------

	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.4.5-hadoop-3.1.0 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="3.1.0" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.4.5-hadoop-3.1.0
	sudo docker rmi mpolatcan/hbase:ubuntu-1.4.5-hadoop-3.1.0
	
	sudo docker build -q -t mpolatcan/hbase:alpine-1.4.5-hadoop-3.1.0 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="3.1.0" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.4.5-hadoop-3.1.0
	sudo docker rmi mpolatcan/hbase:alpine-1.4.5-hadoop-3.1.0
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.4.5-hadoop-3.0.3 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="3.0.3" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.4.5-hadoop-3.0.3
	sudo docker rmi mpolatcan/hbase:ubuntu-1.4.5-hadoop-3.0.3
	
	sudo docker build -q -t mpolatcan/hbase:alpine-1.4.5-hadoop-3.0.3 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="3.0.3" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.4.5-hadoop-3.0.3
	sudo docker rmi mpolatcan/hbase:alpine-1.4.5-hadoop-3.0.3
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.4.5-hadoop-3.0.2 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="3.0.2" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.4.5-hadoop-3.0.2
	sudo docker rmi mpolatcan/hbase:ubuntu-1.4.5-hadoop-3.0.2
	
	sudo docker build -q -t mpolatcan/hbase:alpine-1.4.5-hadoop-3.0.2 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="3.0.2" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.4.5-hadoop-3.0.2
	sudo docker rmi mpolatcan/hbase:alpine-1.4.5-hadoop-3.0.2
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.9.1 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="2.9.1" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.9.1
	sudo docker rmi mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.9.1
	
	sudo docker build -q -t mpolatcan/hbase:alpine-1.4.5-hadoop-2.9.1 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="2.9.1" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.4.5-hadoop-2.9.1
	sudo docker rmi mpolatcan/hbase:alpine-1.4.5-hadoop-2.9.1
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.9.0 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="2.9.0" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.9.0
	sudo docker rmi mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.9.0
	
	sudo docker build -q -t mpolatcan/hbase:alpine-1.4.5-hadoop-2.9.0 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="2.9.0" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.4.5-hadoop-2.9.0
	sudo docker rmi mpolatcan/hbase:alpine-1.4.5-hadoop-2.9.0
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.8.4 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="2.8.4" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.8.4
	sudo docker rmi mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.8.4
	
	sudo docker build -q -t mpolatcan/hbase:alpine-1.4.5-hadoop-2.8.4 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="2.8.4" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.4.5-hadoop-2.8.4
	sudo docker rmi mpolatcan/hbase:alpine-1.4.5-hadoop-2.8.4

	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.7.6 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="2.7.6" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.7.6
	sudo docker rmi mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.7.6
	
	sudo docker build -q -t mpolatcan/hbase:alpine-1.4.5-hadoop-2.7.6 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="2.7.6" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.4.5-hadoop-2.7.6
	sudo docker rmi mpolatcan/hbase:alpine-1.4.5-hadoop-2.7.6
	
	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.6.5 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="2.6.5" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.6.5
	sudo docker rmi mpolatcan/hbase:ubuntu-1.4.5-hadoop-2.6.5
	
	sudo docker build -q -t mpolatcan/hbase:alpine-1.4.5-hadoop-2.6.5 --build-arg HBASE_VERSION="1.4.5" --build-arg HADOOP_VERSION="2.6.5" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.4.5-hadoop-2.6.5
	sudo docker rmi mpolatcan/hbase:alpine-1.4.5-hadoop-2.6.5
# ----------------------------------------------------------------------------------------------------------------------

	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-3.1.0 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="3.1.0" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-3.1.0
	sudo docker rmi mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-3.1.0

	sudo docker build -q -t mpolatcan/hbase:alpine-1.2.6.1-hadoop-3.1.0 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="3.1.0" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.2.6.1-hadoop-3.1.0
	sudo docker rmi mpolatcan/hbase:alpine-1.2.6.1-hadoop-3.1.0

	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-3.0.3 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="3.0.3" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-3.0.3
	sudo docker rmi mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-3.0.3

	sudo docker build -q -t mpolatcan/hbase:alpine-1.2.6.1-hadoop-3.0.3 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="3.0.3" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.2.6.1-hadoop-3.0.3
	sudo docker rmi mpolatcan/hbase:alpine-1.2.6.1-hadoop-3.0.3

	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-3.0.2 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="3.0.2" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-3.0.2
	sudo docker rmi mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-3.0.2

	sudo docker build -q -t mpolatcan/hbase:alpine-1.2.6.1-hadoop-3.0.2 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="3.0.2" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.2.6.1-hadoop-3.0.2
	sudo docker rmi mpolatcan/hbase:alpine-1.2.6.1-hadoop-3.0.2

	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.9.1 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="2.9.1" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.9.1
	sudo docker rmi mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.9.1

	sudo docker build -q -t mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.9.1 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="2.9.1" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.9.1
	sudo docker rmi mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.9.1

	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.9.0 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="2.9.0" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.9.0
	sudo docker rmi mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.9.0

	sudo docker build -q -t mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.9.0 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="2.9.0" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.9.0
	sudo docker rmi mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.9.0

	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.8.4 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="2.8.4" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.8.4
	sudo docker rmi mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.8.4

	sudo docker build -q -t mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.8.4 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="2.8.4" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.8.4
	sudo docker rmi mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.8.4

	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.7.6 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="2.7.6" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.7.6
	sudo docker rmi mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.7.6

	sudo docker build -q -t mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.7.6 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="2.7.6" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.7.6
	sudo docker rmi mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.7.6

	sudo docker build -q -t mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.6.5 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="2.6.5" ./ubuntu/
	sudo docker push mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.6.5
	sudo docker rmi mpolatcan/hbase:ubuntu-1.2.6.1-hadoop-2.6.5

	sudo docker build -q -t mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.6.5 --build-arg HBASE_VERSION="1.2.6.1" --build-arg HADOOP_VERSION="2.6.5" ./alpine/
	sudo docker push mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.6.5
	sudo docker rmi mpolatcan/hbase:alpine-1.2.6.1-hadoop-2.6.5