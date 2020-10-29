#!/bin/bash

echo "install prerequisites..."
sudo apt-get install perl python3
sudo apt-get install git make autoconf g++ flex bison
os_version="$(lsb_release -si)"
if [[ "$os_version" == "Ubuntu" ]]
then
  echo "Tring to install ubuntu prerequisites"	
  sudo apt-get install libfl2 libfl-dev zlibc zlib1g zlib1g-dev  # Ubuntu only (ignore if gives error)
else
	echo "Tring to install non-ubuntu prerequisites"
	sudo apt-get install libgz  # Non-Ubuntu (ignore if gives error)
fi

# For Java
echo "installing java..."
sudo apt install default-jdk
status=$?
[ ${status} -eq 0 ] && echo "Java installation is successful" || echo "Java installation is failed!"

# For Sbt
echo "installing sbt..."
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update
sudo apt-get install sbt
status=$?
[ ${status} -eq 0 ] && echo "sbt installation is successful" || echo "sbt installation is failed!"

# install simplechisel
echo "installing simplechisel..."
git clone https://github.com/SimpleChisel/simple-chisel.git simple-chisel
pushd simple-chisel
git checkout simple-chisel-release
sbt publishLocal
status=$?
[ ${status} -eq 0 ] && echo "simplechisel installation is successful" || echo "simplechisel installation is failed!"
popd

# install q100
echo "installing q100..."
git clone https://github.com/SimpleChisel/q100.git q100
pushd q100
mkdir output_files
popd
status=$?
[ ${status} -eq 0 ] && echo "q100 installation is successful" || echo "q100 installation is failed!"

# install yosys
echo "installing yosys..."
sudo apt-get install yosys
status=$?
[ ${status} -eq 0 ] && echo "Yosys installation is successful" || echo "Yosys installation is failed!"

# install verilator
echo "installing verilator..."
sudo apt-get install verilator
status=$?
[ ${status} -eq 0 ] && echo "verilator installation is successful" || echo "verilator installation is failed!"

# install cog
echo "installing cogapp..."
pip3 install cogapp
status=$?
[ ${status} -eq 0 ] && echo "cogapp installation is successful" || echo "cogapp installation is failed!"
