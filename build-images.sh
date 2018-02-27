# Copyright (c) Mihai Paraschiv.
# Distributed under the terms of the Modified BSD License.

set -e

OWNER=mihaiparaschiv
VERSION=0.2.9


docker build -t ${OWNER}/data-science-base:latest ./data-science-base
docker build -t ${OWNER}/data-science-base:${VERSION} ./data-science-base

docker build -t ${OWNER}/data-science-spark:latest ./data-science-spark
docker build -t ${OWNER}/data-science-spark:${VERSION} ./data-science-spark
