FROM jupyter/pyspark-notebook:latest
MAINTAINER Mihai Paraschiv <mihai.paraschiv@gmail.com>

USER root

# RSpark configuration
ENV R_LIBS_USER $SPARK_HOME/R/lib

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

# install R
RUN conda config --add channels r && \
    conda install -n root --quiet --yes \
    'r-base=3.2*' \
    'r-essentials=1*' \
    && conda clean -tipsy

# install R packages
RUN R --vanilla -e "\
    install.packages(c('forecast', 'lubridate', 'ROCR'), \
    repos='http://cran.us.r-project.org', \
    lib='${CONDA_DIR}/lib/R/library')"

# update packages available in Anaconda
RUN conda install -n root --quiet --yes \
    'seaborn' 'mkl' 'mkl-service' 'mkl-rt' \
    && conda clean -tipsy

# install other Python packages
RUN pip3 install \
    'rpy2==2.8.*' \
    'matplotlib_venn==0.11.*' \
    'git+git://github.com/paulgb/sklearn-pandas.git@7a3c997a00d23135cfcfe6320c4886cdbccf6ee8'
