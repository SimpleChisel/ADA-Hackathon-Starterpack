# ADA Hackathon Challenge #1 Starter Kit

Here are all the software and packages needed for the hackathon challenge. I tried to pack everything into one script file. However, it is practically hard considering people have different systems and different setups. If the script doesn't work, try to install it manually. Don't hesitate to mail me (chshibo@umich.edu) or slack me if something doesn't work. I will solve the problem with you :)

## Menu
- [Prerequisites](#prerequisites)
- [One-Click Installation](#one-click-installation)
- [Install One-by-one](#install-one-by-one)
	- [Java & Sbt](#java\ &\ sbt)
	- [SimpleChisel](#simplechisel)
	- [Q100 Component Library](#q100)
	- [Yosys (Optional)](#yosys\ (optional))
	- [Verilator](#verilator)
	- [Cog](#Cog)
- [Check-up](#check-up)
- [Upgrade](#upgrade)
## Prerequisites
Make sure you install prerequisitse to solve potential dependency issues.
```

# for verilator
sudo apt-get install perl python3
sudo apt-get install git make autoconf g++ flex bison
sudo apt-get install libgz  # Non-Ubuntu (ignore if gives error)
sudo apt-get install libfl2 libfl-dev zlibc zlib1g zlib1g-dev  # Ubuntu only (ignore if gives error)

```

## One-Click Installation
To make things easy, I have compiled a script to install all packages. However, this will require root priviledge. If you don't want to install those packages as root or you already other versions already installed for you other work, DO NOT USE IT, because it may mess up your dependency. Use it as follows:
```
git clone git@github.com:SimpleChisel/ADA-Hackathon-Starterpack.git ada-hackathon
cd ada-hackathon
chmod +x install.sh
sudo ./install.sh
```

## Install One-by-one

### [Java & Sbt]():
The default Java and Sbt should work. Since we have specified the Sbt version to use in our project `build.st`, you don't need to worry about the sbt script version. 
To get Java and Sbt:
```
# For Java
sudo apt install default-jdk

# For Sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update
sudo apt-get install sbt
```

### [SimpleChisel](https://github.com/SimpleChisel/simple-chisel):
```
git clone https://github.com/SimpleChisel/simple-chisel.git
cd simple-chisel
git checkout simple-chisel-release
sbt publishLocal
```

### [Q100 Component Library]():

### [Yosys (Optional)](https://github.com/YosysHQ/yosys):
This is optional. If you have access to your own synthesis tool, you can ignore this. We will use Yosys to evaluate the design. You don't necessarily need to learn how to use Yosys. We will have script for you.
Install with Package Manager:
```
sudo apt-get install yosys
```

Manually install:
```
# make sure you have right dependencies
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
```

### [Verilator](https://github.com/verilator/verilator/blob/master/docs/install.adoc):
We will use verilator to verify our design. You don't necessarily need to learn how to use verilator. We have script for you.

Install with package manager:
```
sudo apt-get install verilator
```

Manually install:
```
git clone https://github.com/verilator/verilator
cd verilator
autoconf        # Create ./configure script
./configure
make
sudo make install
```

### [Cog](https://nedbatchelder.com/code/cog/):
	
Cog is a python-based template generator. Again, you don't need to learn how to use it, but make sure you have it installed on your system. We will need it to generate verilator test file. Use Python2 should probably be fine but I recommend Python3.

```
pip3 install cogapp
```
## Check-up

## Update
To improve the overall experience, we are still working around the clock to debug SimpleChisel and Q100 component library.