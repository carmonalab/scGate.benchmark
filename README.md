# scGate.benchmark
This repository allows reproducing the benchmark test in scGate's paper.

# Predictive performance of scGate vs SingleR
[scGate.benchmark.Rmd](https://github.com/carmonalab/scGate.benchmark/blob/master/scGate.benchmark.Rmd) reproduces Figure 1 E

# Runing time performance

[runing_time_comparison_on_docker.Rmd](https://github.com/carmonalab/scGate.benchmark/blob/master/runing_time_comparison_on_docker.Rmd) reproduces Figure 1 F (running time scGate vs SingleR)

For reproduciblity we run this test on a Docker container, created with this [Dockerfile](https://github.com/carmonalab/scGate.benchmark/blob/master/Dockerfile). 

## Detailed instructions:

You can install Docker in your machine following the [install instructions](https://docs.docker.com/engine/install/)

Clone scGate.benchmark repo
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

After that, you can open the **runing_time_comparison_on_docker.Rmd** notebook and reproduce figure 1 F of scGate's paper.
