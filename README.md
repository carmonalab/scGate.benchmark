# scGate.benchmark
This repository is intended to reproduce the resuts of the benchmark test in [paper](url_here). 

# Performance comparison against SingleR
write it down

## Runing time performance
In order to be reproducible results we do it in a docker container.

### First we a few instructions to locally create the container
First, you can install dropbox in your machine following the [install instructions](https://docs.docker.com/engine/install/)
git clone https://github.com/carmonalab/scGate.benchmark.git
cd scGate.benchmark
mkdir aux
wget https://cran.rstudio.com/src/contrib/matrixStats_0.61.0.tar.gz -O ./aux/matrixStats_0.61.0.tar.gz
sudo docker build -t scgate_benchmark --build-arg version=$source . 2>&1 | tee docker.build.log
sudo docker run --rm -p 8787:8787 -v /PATH/TO/scGate.benchmark:/home/rstudio/Figures -e PASSWORD=password -m 16000m --cpuset-cpus="0-3"  scgate_benchmark
