################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################

LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="Metagen-FastQC"
LABEL software.version="1.0"
LABEL about.summary="A tool to Clean metagenomic reads,  remove adapters, low-quality bases and host (e.g. human) contamination"
LABEL about.home="https://github.com/Finn-Lab/Metagen-FastQC"
LABEL about.documentation="https://github.com/Finn-Lab/Metagen-FastQC/blob/master/README.md"
LABEL license=""
LABEL about.tags="Metagenomics, Contaminant, adapters, low-quality bases"

################## MAINTAINER ######################
MAINTAINER Blaise Alako <blaise@ebi.ac.uk>


# WORKDIR
WORKDIR /home/biodocker

RUN conda install bedtools
RUN conda install -c bioconda bwa
RUN conda install -c bioconda trim-galore
RUN conda install -c bioconda samtools

# Metagen-FastQC pipeline
RUN git clone https://github.com/Finn-Lab/Metagen-FastQC.git
RUN chmod a+x /home/biodocker/Metagen-FastQC/metagen-fastqc.sh

# environmental variables
ENV PATH $PATH:/home/biodocker/Metagen-FastQC

WORKDIR /data/
CMD ["metagen-fastqc.sh"]

