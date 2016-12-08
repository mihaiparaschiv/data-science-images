# Copyright (c) Mihai Paraschiv.
# Distributed under the terms of the Modified BSD License.

FROM jupyter/scipy-notebook:18e5563b7486
MAINTAINER Mihai Paraschiv <mihai.paraschiv@gmail.com>


# Install required OS packages ################################################

USER root

# libraries needed for R and rpy2
# x11 is needed for plotting in r
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    gfortran \
    gcc \
    libreadline-gplv2-dev \
    x11vnc \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_USER


# Install Python packages in Python 3 environment #############################

# Install Python packages from PyPI
RUN pip3 install \
    'lifelines==0.9.*' \
    'lifetimes==0.2.*' \
    'matplotlib_venn==0.11.*'

# Install Python packages from source
RUN pip3 install \
    'git+git://github.com/paulgb/sklearn-pandas.git@47148d7401a1419f621b7dfa66565b84b61a6dc6'

# Install XGBoost
# See https://github.com/jupyter/docker-stacks/wiki/Docker-recipes#use-xgboost
RUN conda install -n root -y gcc
RUN pip3 install "xgboost==0.6a2"


# Install R ###################################################################

# Install R in Python 3 environment
RUN conda config --add channels r && \
    conda install --quiet --yes \
    'rpy2=2.8*' \
    'r-base=3.3.1 1' \
    'r-irkernel=0.7*' \
    'r-plyr=1.8*' \
    'r-devtools=1.11*' \
    'r-dplyr=0.4*' \
    'r-ggplot2=2.1*' \
    'r-tidyr=0.5*' \
    'r-shiny=0.13*' \
    'r-rmarkdown=0.9*' \
    'r-forecast=7.1*' \
    'r-stringr=1.0*' \
    'r-rsqlite=1.0*' \
    'r-reshape2=1.4*' \
    'r-caret=6.0*' \
    'r-rcurl=1.95*' \
    'r-randomforest=4.6*' \
    'r-lubridate=1.5*' \
    'r-xts=0.9*' \
    && conda clean -tipsy

# Install additional R packages
RUN R --vanilla -e "\
    install.packages(c('ROCR', 'BTYD'), \
    repos='http://cran.us.r-project.org', \
    lib='${CONDA_DIR}/lib/R/library')"


ENV TERM xterm