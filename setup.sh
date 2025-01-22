#!/bin/bash

allSetup(){
	dnf install -y cmake
	dnf install -y gcc
	dnf install -y g++
	dnf install -y libX11-devel libXpm-devel libXft-devel libXext-devel
	dnf install -y openssl-devel
	dnf install -y expat-devel
	dnf install -y epel-release
	dnf install -y xerces-c-devel
	dnf install -y qt5-qtbase-devel
	dnf install -y libX11-devel libXmu-devel
	dnf install -y openmotif-devel
	dnf install -y mesa-libGL-devel mesa-libGLU-devel
	dnf install -y tree
	dnf install -y gdb
	dnf install -y valgrind
}

getRoot(){
	git clone --branch latest-stable --depth=1 https://github.com/root-project/root.git root_src
	mkdir root_build ./local/root_install && cd root_build
	cmake -Dxrootd=OFF -Dbuiltin_xrootd=OFF -DCMAKE_INSTALL_PREFIX=../local/root_install ../root_src
	make -j7
	make install
	cd ..
	rm -rf root_src/
	rm -rf root_build/
        echo "Done ROOT ..........!!"	
} 

getGeant4(){
	wget https://gitlab.cern.ch/geant4/geant4/-/archive/v10.6.1/geant4-v10.6.1.tar.gz
	tar -xzf geant4-v10.6.1.tar.gz
	mkdir geant4-v10.6.1_build local/geant4-v10.6.1_install
	cd geant4-v10.6.1_build
	cmake -DGEANT4_INSTALL_DATA=ON -DGEANT4_USE_GDML=ON -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_XM=ON -DGEANT4_USE_QT=ON -DGEANT4_BUILD_MULTITHREADED=ON -DGEANT4_USE_RAYTRACER_X11=ON -DCMAKE_INSTALL_PREFIX=../local/geant4-v10.6.1_install ../geant4-v10.6.1
	make -j7
	make install
	cd ../
	rm -rf geant4-v10.6.1.tar.gz
	rm -rf geant4-v10.6.1/ 
	rm -rf geant4-v10.6.1_build
        echo "Done GEANT4 ..........!!"	
}

getBoost(){
	wget https://archives.boost.io/release/1.85.0/source/boost_1_85_0.tar.gz
	tar -xzf boost_1_85_0.tar.gz
	mkdir local/boost_1_85_0_install
	cd boost_1_85_0
	./bootstrap.sh --prefix=../local/boost_1_85_0_install
	./b2
	./b2 install
	cd ../
	rm -rf boost_1_85_0/
	rm -rf boost_1_85_0.tar.gz
        echo "Done BOOST ..........!!"	
}

getDk2nu(){
	git clone https://github.com/NuSoftHEP/dk2nu.git
	mkdir dk2nu_build local/dk2nu_install
	cd dk2nu_build
	cmake -DWITH_TBB=OFF -DWITH_GENIE=OFF -DCMAKE_INSTALL_PREFIX=../local/dk2nu_install ../dk2nu
	make -j7
	make install
	cd ../
	rm -rf dk2nu/
	rm -rf dk2nu_build/
        echo "Done DK2NU ..........!!"	
}

mkdir -p /al9g4bnb/local
cd /al9g4bnb
#allSetup
getRoot
getGeant4
getBoost
source /al9g4bnb/local/root_install/bin/thisroot.sh
source /al9g4bnb/local/geant4-v10.6.1_install/bin/geant4.sh
getDk2nu
