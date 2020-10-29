#!/bin/bash

# For Java
echo "installing java..."
sudo apt install default-jdk
status = $?
popd
[ $status -eq 0 ] && echo "Java installation is successful" || echo "Java installation is failed!"

# For Sbt
echo "installing sbt..."
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update
sudo apt-get install sbt
status = $?
popd
[ $status -eq 0 ] && echo "sbt installation is successful" || echo "sbt installation is failed!"

# install yosys
echo "installing yosys..."
sudo apt-get install build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev

git clone https://github.com/YosysHQ/yosys yosys
cd yosys
git checkout 623526d17d36fe85ac1b34ddd1026be34c826b9e
make config-clang
make
echo "PATH=\"$(pwd)/:\$PATH\"" >> ~/.profile
source ~/.profile
status = $?
[ $status -eq 0 ] && echo "Yosys installation is successful" || echo "Yosys installation is failed!"

# install verilator
echo "installing verilator..."
sudo apt-get install verilator
status = $?
[ $status -eq 0 ] && echo "verilator installation is successful" || echo "verilator installation is failed!"

# install cog
echo "installing cogapp..."
pip3 install cogapp
status = $?
[ $status -eq 0 ] && echo "cogapp installation is successful" || echo "cogapp installation is failed!"