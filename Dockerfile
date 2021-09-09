FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git build-essential ca-certificates curl tcsh rsync

RUN curl -O https://afni.nimh.nih.gov/pub/dist/bin/linux_openmp_64/@update.afni.binaries && \
    tcsh @update.afni.binaries -package linux_openmp_64 -bindir /opt/afni -prog_list \
    3dTcorr1D 3dUndump 3dROIstats 3dcalc 3dBlurToFWHM

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libxext-dev libxpm-dev libxmu-dev libxt6 libxft2 

RUN curl -LO http://ftp.debian.org/debian/pool/main/libx/libxp/libxp6_1.0.2-2_amd64.deb && \
    curl -LO http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb && \
    apt-get install ./libxp6_1.0.2-2_amd64.deb ./libpng12-0_1.2.54-1ubuntu1_amd64.deb && \
    rm ./libxp6_1.0.2-2_amd64.deb ./libpng12-0_1.2.54-1ubuntu1_amd64.deb

ENV PATH=$PATH:/opt/afni

# Run the command for validation
RUN 3dTcorr1D
RUN 3dUndump || [ $? -eq 1 ] # exits 1 for help message 🙄
RUN 3dROIstats
RUN 3dcalc
RUN 3dBlurToFWHM

RUN mkdir /scratch
WORKDIR /scratch