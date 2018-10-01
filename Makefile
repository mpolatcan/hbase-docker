.PHONY: publish-hbase
publish-hbase:
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=2.0.2 hadoop_version=3.1.1
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=2.0.2 hadoop_version=3.1.1
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=2.0.2 hadoop_version=3.0.3
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=2.0.2 hadoop_version=3.0.3
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=2.0.2 hadoop_version=3.0.2
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=2.0.2 hadoop_version=3.0.2
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=2.0.2 hadoop_version=2.9.1
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=2.0.2 hadoop_version=2.9.1
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=2.0.2 hadoop_version=2.9.0
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=2.0.2 hadoop_version=2.9.0
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=2.0.2 hadoop_version=2.8.4
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=2.0.2 hadoop_version=2.8.4
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=2.0.2 hadoop_version=2.7.6
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=2.0.2 hadoop_version=2.7.6
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=2.0.2 hadoop_version=2.6.5
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=2.0.2 hadoop_version=2.6.5
# ----------------------------------------------------------------------------------------------------------------------
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.4.7 hadoop_version=3.1.1
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.4.7 hadoop_version=3.1.1
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.4.7 hadoop_version=3.0.3
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.4.7 hadoop_version=3.0.3
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.4.7 hadoop_version=3.0.2
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.4.7 hadoop_version=3.0.2
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.4.7 hadoop_version=2.9.1
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.4.7 hadoop_version=2.9.1
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.4.7 hadoop_version=2.9.0
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.4.7 hadoop_version=2.9.0
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.4.7 hadoop_version=2.8.4
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.4.7 hadoop_version=2.8.4
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.4.7 hadoop_version=2.7.6
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.4.7 hadoop_version=2.7.6
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.4.7 hadoop_version=2.6.5
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.4.7 hadoop_version=2.6.5
# ----------------------------------------------------------------------------------------------------------------------
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.2.7 hadoop_version=3.1.1
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.2.7 hadoop_version=3.1.1
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.2.7 hadoop_version=3.0.3
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.2.7 hadoop_version=3.0.3
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.2.7 hadoop_version=3.0.2
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.2.7 hadoop_version=3.0.2
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.2.7 hadoop_version=2.9.1
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.2.7 hadoop_version=2.9.1
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.2.7 hadoop_version=2.9.0
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.2.7 hadoop_version=2.9.0
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.2.7 hadoop_version=2.8.4
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.2.7 hadoop_version=2.8.4
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.2.7 hadoop_version=2.7.6
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.2.7 hadoop_version=2.7.6
	$(MAKE) publish-hbase-helper dist=ubuntu hbase_version=1.2.7 hadoop_version=2.6.5
	$(MAKE) publish-hbase-helper dist=alpine hbase_version=1.2.7 hadoop_version=2.6.5

.PHONY: publish-hbase-helper
publish-hbase-helper:
	sudo docker build -q -t mpolatcan/hbase:$(dist)-$(hbase_version)-hadoop-$(hadoop_version) --build-arg HBASE_VERSION=$(hbase_version) --build-arg HADOOP_VERSION=$(hadoop_version) ./$(dist)/
	sudo docker push mpolatcan/hbase:$(dist)-$(hbase_version)-hadoop-$(hadoop_version)
	sudo docker rmi $$(sudo docker images -q)