FROM gaow/base-notebook:1.0.0

LABEL mantainer="dmc2245@cumc.columbia.edu"

ARG BOOST_IO
ARG LIB_INSTALL

USER root

WORKDIR /tmp

# Download and compile  bgenix needed for regenie to run

RUN wget https://enkre.net/cgi-bin/code/bgen/tarball/7aa2c109c6/BGEN-7aa2c109c6.tar.gz

RUN gpg --keyserver pgp.mit.edu --recv-key E084DAB9 && gpg -a --export E084DAB9 |  apt-key add -

RUN apt-get update && apt-get install -y --no-install-recommends \
      g++ \
      make \
      python3 \
      zlib1g-dev \
      $LIB_INSTALL\ 
      && tar -xzf BGEN-7aa2c109c6.tar.gz \
      && rm BGEN-7aa2c109c6.tar.gz \
      && cd BGEN-7aa2c109c6 \
      && ./waf configure --prefix=/usr/local/ \
      && ./waf install


# Install pre-requisites for region-extraction pipeline

RUN pip install pandas_plink pybgen scipy memory_profiler

# Download and install PLINK2 version alpha2.3 date:01-24-2020

RUN wget http://s3.amazonaws.com/plink2-assets/alpha2/plink2_linux_x86_64.zip  && \
    unzip plink2_linux_x86_64.zip && \
    cp plink2 /usr/local/bin && \
    rm -rf plink2*

#Download and install  PLINK1.9 beta6.21 date:10-19-2020
RUN wget http://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20201019.zip && \
    unzip plink_linux_x86_64_20201019.zip && \
    cp plink /usr/local/bin && \
    rm -rf plink

# Install qctool
RUN wget https://www.well.ox.ac.uk/~gav/resources/qctool_v2.0.6-Ubuntu16.04-x86_64.tgz && tar -zxvf  qctool_v2.0.6-Ubuntu16.04-x86_64.tgz && \
    rm -rf qctool_v2.0.6-Ubuntu16.04-x86_64.tgz && \
    cd qctool_v2.0.6-Ubuntu16.04-x86_64 && chmod a+x qctool &&\
    cp qctool /usr/local/bin/

#Download and install R packages
RUN Rscript -e 'p = c("ggplot2", "ggrepel", "dplyr", "qqman", "remotes","scales"); install.packages(p, repos="https://cloud.r-project.org")'
RUN Rscript -e 'remotes::install_github("anastasia-lucas/hudson")'
RUN Rscript -e 'remotes::install_github("stephenslab/susieR")'
#Download and intall BOLT-LMM

ADD https://data.broadinstitute.org/alkesgroup/BOLT-LMM/downloads/BOLT-LMM_v2.3.4.tar.gz /tmp/BOLT-LMM_v2.3.4.tar.gz

RUN tar -zxvf BOLT-LMM_v2.3.4.tar.gz && \
    rm -rf BOLT-LMM_v2.3.4.tar.gz && \
    cp BOLT-LMM_v2.3.4/bolt /usr/local/bin/ && \
    cp BOLT-LMM_v2.3.4/lib/* /usr/local/lib/

#Download and install FastGWA

RUN wget https://cnsgenomics.com/software/gcta/bin/gcta_1.93.2beta.zip && \
    unzip gcta_1.93.2beta.zip && \
    cp gcta_1.93.2beta/gcta64 /usr/local/bin/ && \
    rm -rf gcta*
    
# Download and compile regenie from source code

COPY .  /tmp/

WORKDIR /tmp/regenie-1.0.6.9/

RUN  make BGEN_PATH=/tmp/BGEN-7aa2c109c6 HAS_BOOST_IOSTREAM=$BOOST_IO

RUN apt-get update && apt-get install -y --no-install-recommends \
      libgomp1 $LIB_INSTALL \
     &&  cp /tmp/regenie-1.0.6.9/regenie /usr/local/bin

RUN wget https://data.broadinstitute.org/alkesgroup/BOLT-LMM/downloads/BOLT-LMM_v2.3.4.tar.gz && \
    tar -zxvf BOLT-LMM_v2.3.4.tar.gz && \
    rm -rf BOLT-LMM_v2.3.4.tar.gz && \
    cp BOLT-LMM_v2.3.4/bolt /usr/local/bin/ && \
    cp BOLT-LMM_v2.3.4/lib/* /usr/local/lib/

USER jovyan

WORKDIR /home/jovyan
