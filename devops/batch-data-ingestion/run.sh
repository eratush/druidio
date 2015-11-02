#!/bin/bash

java "-Ddruid.extensions.coordinates=[\"io.druid.extensions:druid-s3-extensions\",\"io.druid.extensions:mysql-metadata-storage\"]" \
      -Ddruid.extensions.localRepository=/usr/local/druid/repository \
      -Ddruid.extensions.remoteRepositories=[\"file:///root/.m2/repository/\",\"https://repo1.maven.org/maven2/\"] \
      -Xmx256m -Duser.timezone=UTC -Dfile.encoding=UTF-8 \
      -Dhadoop.fs.s3n.impl=org.apache.hadoop.fs.s3native.NativeS3FileSystem \
      -Dhadoop.fs.s3.impl=org.apache.hadoop.fs.s3native.NativeS3FileSystem \
      -Dfs.s3n.awsAccessKeyId=AKIAJUJVSAQCIZG4CPCA \
      -Dfs.s3n.awsSecretAccessKey=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 \
      -classpath /usr/local/druid/lib/*:/hadoop-conf/*:$HADOOP_CONF_DIR:$HADOOP_COMMON_HOME/share/hadoop/common/*:$HADOOP_COMMON_HOME/share/hadoop/common/lib/*:$HADOOP_HDFS_HOME/share/hadoop/hdfs/*:$HADOOP_HDFS_HOME/share/hadoop/hdfs/lib/*:$HADOOP_YARN_HOME/share/hadoop/yarn/*:$HADOOP_YARN_HOME/share/hadoop/yarn/lib/* \
      io.druid.cli.Main index hadoop /hadoop_batch_ingestion_spec_file.json