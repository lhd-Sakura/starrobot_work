sudo apt-get update

# Install CMake 3.2 for Ubuntu Trusty and Debian Jessie.
sudo apt-get install lsb-release -y
if [[ "$(lsb_release -sc)" = "trusty" ]]
then
  sudo apt-get install cmake3 -y
elif [[ "$(lsb_release -sc)" = "jessie" ]]
then
  sudo sh -c "echo 'deb http://ftp.debian.org/debian jessie-backports main' >> /etc/apt/sources.list"
  sudo apt-get update
  sudo apt-get -t jessie-backports install cmake -y
else
  sudo apt-get install cmake -y
fi

sudo apt-get install -y \
    clang \
    g++ \
    git \
    google-mock \
    libboost-all-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libeigen3-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    liblua5.2-dev \
    libsuitesparse-dev \
    ninja-build \
    python-sphinx


cd ~/ && mkdir cartographer_tools/
cd ~/cartographer_tools/
git clone https://github.com/starRureole/ceres-solver-1.13.0.git
cd ceres-solver-1.13.0/ 
mkdir build && cd build
cmake .. -G Ninja -DCXX11=ON
ninja
CTEST_OUTPUT_ON_FAILURE=1 ninja test
sudo ninja install


cd ~/cartographer_tools/
git clone https://github.com/starRureole/protobuf-3.4.1.git
cd protobuf-3.4.1/
mkdir build && cd build
cmake -G Ninja \
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -Dprotobuf_BUILD_TESTS=OFF \
  ../cmake
ninja
sudo ninja install


cd ~/cartographer_tools/
git clone https://github.com/googlecartographer/cartographer.git
cd cartographer/
mkdir build && cd build
cmake .. -G Ninja
ninja
CTEST_OUTPUT_ON_FAILURE=1 ninja test
sudo ninja install



cd ~/ && mkdir -p cartographer_ws/src/
cd ~/cartographer_ws/src/ && git clone https://github.com/googlecartographer/cartographer_ros.git





