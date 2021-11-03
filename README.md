# scGate.benchmark
mkdir aux
wget https://cran.rstudio.com/src/contrib/matrixStats_0.61.0.tar.gz -O ./aux/matrixStats_0.61.0.tar.gz
sudo docker build -t stacas_demo --build-arg version=$source . 2>&1 | tee docker.build.log
sudo docker run --rm -p 8787:8787 -v /PATH/TO/DATA:/home/rstudio/Datasets -v /PATH/TO/scGate.benchmark/Figures:/home/rstudio/Figures -e PASSWORD=hello -m 64000m --cpuset-cpus="0-3"  scgate_benchmark
