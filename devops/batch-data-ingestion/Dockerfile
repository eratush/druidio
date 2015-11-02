FROM ubuntu:14.04

# Add Java 8 repository
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:webupd8team/java \
      && apt-get update

# Oracle Java 8
RUN echo oracle-java-8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
      && apt-get install -y oracle-java8-installer \
      && apt-get install -y oracle-java8-set-default

# Druid (release tarball)
ENV DRUID_VERSION 0.8.1
RUN wget -q -O - http://static.druid.io/artifacts/releases/druid-$DRUID_VERSION-bin.tar.gz | tar -xzf - -C /usr/local
RUN ln -s /usr/local/druid-$DRUID_VERSION /usr/local/druid

COPY hadoop_batch_ingestion_spec_file.json /hadoop_batch_ingestion_spec_file.json

COPY run.sh run.sh
RUN chmod +x run.sh

ENTRYPOINT ["./run.sh"]