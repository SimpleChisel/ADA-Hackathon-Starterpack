FROM ubuntu:20.04

ARG DEFAULT_WORKDIR=/ADA-hackathon

#Prerequisites packages
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    perl \
    python3 \
    python3-pip \
    git \
    curl \
    make \
    autoconf \
    g++ \
    flex \
    bison \
    libfl2 \
    libfl-dev \
    zlibc \
    zlib1g \
    zlib1g-dev \
    gnupg \
    yosys \
    verilator 

#Install JAVA
RUN DEBIAN_FRONTEND="noninteractive" apt install -y default-jdk

#Install Sbt
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
RUN apt-get update && apt-get install -y sbt 


WORKDIR $DEFAULT_WORKDIR

#Install SimpleChisel
RUN git clone https://github.com/SimpleChisel/simple-chisel.git
WORKDIR simple-chisel
RUN git checkout simple-chisel-release
RUN sbt publishLocal

#Install q100
WORKDIR $DEFAULT_WORKDIR
RUN git clone https://github.com/SimpleChisel/q100.git
RUN mkdir q100/output_files

#Install cogapp
RUN pip3 install cogapp
