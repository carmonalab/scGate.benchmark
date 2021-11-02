FROM rocker/rstudio:4.1.0
#Modified by AB. on 27/10/2021 from rocker/rstudio:4.1.0, to include more compilers and custom R packages

ARG version=1.0
ARG RSTUDIO_VERSION

RUN apt-get clean all && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    libhdf5-dev \
    libcurl4-gnutls-dev \
    libssl-dev \
    libxml2-dev \
    libpng-dev \
    libxt-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libglpk40 \
    libgit2-28 \
  && apt-get clean all && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
RUN Rscript -e "install.packages(c('rmarkdown', 'tidyverse', 'workflowr', 'BiocManager'));" 
RUN Rscript -e "BiocManager::install(c('dplyr','remotes','patchwork'))"
RUN Rscript -e "BiocManager::install(c('BiocParallel','parallel'))"
COPY aux/matrixStats_0.61.0.tar.gz /home/rstudio/matrixStats_0.61.0.tar.gz
RUN Rscript -e "install.packages('./home/rstudio/matrixStats_0.61.0.tar.gz',repos = NULL, type='source')"
RUN rm /home/rstudio/matrixStats_0.61.0.tar.gz
Run Rscript -e "BiocManager::install(c('SingleR','celldex'))" 
RUN Rscript -e "remotes::install_github('carmonalab/UCell')" \
  && Rscript -e "remotes::install_github('carmonalab/scGate', ref='dev')" 
#COPY user-settings /home/rstudio/.rstudio/monitored/user-settings/user-settings
#COPY .Rprofile /home/rstudio/

