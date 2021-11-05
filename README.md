# scGate.benchmark
This repository is intended to reproduce the resuts of the benchmark test in [paper](url_here). 

# Performance comparison against SingleR
write it down

## Runing time performance
In order to do reproducible results we do it in a docker container.

### First, a few instructions to locally create the container
* You can install dropbox in your machine following the [install instructions](https://docs.docker.com/engine/install/)

cloning scGate.benchmark repo
```
git clone https://github.com/carmonalab/scGate.benchmark.git
cd scGate.benchmark
``` 

download matrixStats dependency 
```
mkdir aux
wget https://cran.rstudio.com/src/contrib/matrixStats_0.61.0.tar.gz -O ./aux/matrixStats_0.61.0.tar.gz
```

Build container
```
source=1.0
sudo docker build -t scgate_benchmark --build-arg version=$source . 2>&1 | tee docker.build.log
```

Run docker container limiting cpus and memmory capabilities
```
sudo docker run --rm -p 8787:8787 -v /PATH/TO/scGate.benchmark:/home/rstudio/scGate.benchmark -e PASSWORD=your_deired_passw -m 16000m --cpuset-cpus="0-3"  scgate_benchmark
```

Then, you can open in a browser localhost:8787 and loging with rstudio user and your_desired_passw

After that, you can open the **runing_time_comparison_on_docker.Rmd** notebook and reproduce figure 1g of our paper.
