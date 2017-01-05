# Copyright (c) Mihai Paraschiv.
# Distributed under the terms of the Modified BSD License.

FROM mihaiparaschiv/data-science-base:latest
MAINTAINER Mihai Paraschiv <mihai.paraschiv@gmail.com>


USER root

# Install Spark
ENV APACHE_SPARK_VERSION=2.1.0
ENV APACHE_SPARK_SHA512=3fc94096ae34f9a1a148d37e5ed640a7e5de1812f1f2ecd715d92bbf2901e895cf4b93e6d8ee0d64debb5df7c56d673c0a36e5fc49503ec0f4507eb0edf961a4

RUN echo 'deb http://cdn-fastly.deb.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get -y update && \
    apt-get install -y --no-install-recommends openjdk-8-jre-headless && \
    rm /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
        wget -q http://d3kbcqa49mib13.cloudfront.net/spark-${APACHE_SPARK_VERSION}-bin-hadoop2.7.tgz && \
        echo "${APACHE_SPARK_SHA512} *spark-${APACHE_SPARK_VERSION}-bin-hadoop2.7.tgz" | shasum -a 512 -c - && \
        tar xzf spark-${APACHE_SPARK_VERSION}-bin-hadoop2.7.tgz -C /usr/local && \
        rm spark-${APACHE_SPARK_VERSION}-bin-hadoop2.7.tgz
RUN cd /usr/local && ln -s spark-${APACHE_SPARK_VERSION}-bin-hadoop2.7 spark

# Spark configuration
ENV SPARK_HOME /usr/local/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip
ENV SPARK_OPTS --driver-java-options=-Xms1024M --driver-java-options=-Xmx4096M --driver-java-options=-Dlog4j.logLevel=info
ENV R_LIBS_USER $SPARK_HOME/R/lib

USER $NB_USER
