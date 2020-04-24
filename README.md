# Metagen-FastQC-Docker
A containerized version of [Metagen-FastQC](https://github.com/Finn-Lab/Metagen-FastQC) toolkit
![alt text](fig/docker_logo_horizontal.png)

### Prerequisite.

The open-source software Docker must be pre-installed for the proper functioning of the Metagen-FastQC docker version:  
[Follow instruction for setting up docker in your machine](https://github.com/EBI-COMMUNITY/ebi-selecta#SELECTA-framework-Docker-Compose-version)

### Get and build the metagen-fastqc docker image.
#### 1. Step1

```
git clone https://github.com/alakob/Metagen-FastQC-Docker.git \
    && cd Metagen-FastQC-Docker \
    && docker build --tag metagen-fastqc .
```
### Create a working directory to host the Human genome sequence and corresponding indexes for decontamination purposes.

#### 2. Step2
```
mkdir data && cd data && \
     wget http://ftp.ebi.ac.uk/pub/databases/metagenomics/genome_sets/bwa_hg38.tar.gz && \
      tar xvf bwa_hg38.tar.gz && rm -f bwa_hg38.tar.gz
```
### Clean the metagenomic read.

#### 3.1 Step3: Clean paired-end reads
```
docker run --name metagen-clean -v $(pwd):/data \
       metagen-fastqc:latest  \
       metagen-fastqc.sh -t 8  -f read_1.fastq.gz -r read_2.fastq.gz -c hg38.fa
```
#### 3.2 Step3: Clean single-end reads
```
docker run --name metagen-name -v $(pwd):/data \
        metagen-fastqc:latest  \
        metagen-fastqc.sh -t 8  -f read.fastq.gz -c hg38.fa
```

