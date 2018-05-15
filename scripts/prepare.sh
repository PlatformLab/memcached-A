#!/bin/bash

## This script will help you to download arachne-all and build memcached
INSTALL_PREFIX=/usr/local/memcached-A # Change this to your installation directory

# First, recursively clone Arachne super repository inside memcached top level
# directory.
MEMCACHED_DIR=$(dirname $(dirname $(readlink -f $0)))
cd $MEMCACHED_DIR

ARACHNE_DIR=${MEMCACHED_DIR}/arachne-all
echo "Installing arachne-all to ${ARACHNE_DIR}"

git clone --recursive https://github.com/PlatformLab/arachne-all.git ${ARACHNE_DIR}
pushd arachne-all
./buildAll.sh
popd

# Second, buidl memcached-A itself
echo "Compiling memcached-A"
./autogen.sh
./configure --prefix=${INSTALL_PREFIX}
make -j16
