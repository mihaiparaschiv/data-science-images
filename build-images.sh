# Copyright (c) Mihai Paraschiv.
# Distributed under the terms of the Modified BSD License.

GIT_MASTER_HEAD_SHA=$(git rev-parse --short=12 --verify HEAD)
OWNER=mihaiparaschiv


docker build -t ${OWNER}/data-science-base:latest ./data-science-base
docker build -t ${OWNER}/data-science-base:${GIT_MASTER_HEAD_SHA} ./data-science-base

docker build -t ${OWNER}/data-science-spark:latest ./data-science-spark
docker build -t ${OWNER}/data-science-spark:${GIT_MASTER_HEAD_SHA} ./data-science-spark