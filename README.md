# scGate.benchmark
This repository allows reproducing the benchmark test in the scGate manuscript.

# Predictive performance of scGate vs other classifiers
[scGate.benchmark.Rmd](https://github.com/carmonalab/scGate.benchmark/blob/master/scGate.benchmark.Rmd) reproduces predictive performance for isolating target cell types in 5 dataset for 4 different methods (scGate, Garnett, SCINA, SingleR).

The data comes from the following studies:
* [Hao et al. *Cell* (2021)](https://pubmed.ncbi.nlm.nih.gov/34062119/) - Human peripheral blood mononuclear cells (PBMCs)
* [Jerby-Arnon et al. *Cell* (2018)](https://pubmed.ncbi.nlm.nih.gov/30388455/) - Melanoma tumors from multiple patients
* [Zilionis et al. *Immunity* (2019)](https://pubmed.ncbi.nlm.nih.gov/30979687/) - Non-small cell lung cancer
* [Yost et al. *Nature Medicine* (2019)](https://pubmed.ncbi.nlm.nih.gov/31359002/) - Basal or squamous cell carcinoma
* [Abdelaal et al. *Genome Biology* (2019)](https://pubmed.ncbi.nlm.nih.gov/31500660/) - Author annotations of PBMC data from [Ding et al. *Nat Biotechnol* (2020)](https://pubmed.ncbi.nlm.nih.gov/32341560/)

# Running time performance

[running_time_comparison_on_docker.Rmd](https://github.com/carmonalab/scGate.benchmark/blob/master/runing_time_comparison_on_docker.Rmd) allows estimating the running time of scGate on datasets of variable size.

For reproduciblity we run this test on a Docker container, created with this [Dockerfile](https://github.com/carmonalab/scGate.benchmark/blob/master/Dockerfile). 

## Detailed instructions for Docker:

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
