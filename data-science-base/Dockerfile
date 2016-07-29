# Copyright (c) Mihai Paraschiv.
# Distributed under the terms of the Modified BSD License.

FROM jupyter/scipy-notebook:1d374670daaa
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


# Update Python 3 environment #################################################

# update all python packages
RUN conda update -n root --all --quiet --yes

# update packages available in Anaconda
RUN conda install -n root --quiet --yes \
    'seaborn' 'mkl' 'mkl-service' 'mkl-rt' \
    && conda clean -tipsy

# install other Python packages
RUN pip3 install \
    'lifelines==0.9.*' \
    'lifetimes==0.2.*' \
    'matplotlib_venn==0.11.*' \
    'git+git://github.com/paulgb/sklearn-pandas.git@7a3c997a00d23135cfcfe6320c4886cdbccf6ee8'


# Install R ###################################################################

# install R in Python 3 environment
RUN conda config --add channels r && \
    conda install -n root --quiet --yes \
    'r-base=3.2*' \
    'r-essentials=1*' \
    && conda clean -tipsy

# install R packages
RUN R --vanilla -e "\
    install.packages(c('forecast', 'lubridate', 'ROCR', 'BTYD'), \
    repos='http://cran.us.r-project.org', \
    lib='${CONDA_DIR}/lib/R/library')"

RUN pip3 install 'rpy2==2.8.*'