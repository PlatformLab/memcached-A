# Memcached and Memcached-A (Under Construction)

## Note
This repo contains two major branches:
the original memcached version 1.5.6 (master branch);
and the memcached-A (restructured memcached with Arachne, memcached-A branch).

Memcached-A is currently under construction; the unit tests may be failing.

## coreTrace branch
This branch adds CORETRACE and IOCOUNT flag in Makefile.am, based on original
memcached version 1.5.6.
If enabling CORETRACE flag, it will dump the changes of core for each thread,
including the worker threads, main thread and background threads.
If enabling IOCOUNT flag, it can log the time for libevent turnaround and
network read/write. It will also log the number of changes of the core on each
worker thread.

## How do I use coreTrace?
0. Clone this repo and switch to coreTrace branch.
```
    git clone https://github.com/PlatformLab/memcached.git ${MEMCACHE_DIR}
    cd ${MEMCACHE_DIR}
    git fetch
    git checkout coreTrace
```

1. Recursively clone [Arachne super repository](https://github.com/PlatformLab/arachne-all)
inside memcached top level directory.
```
     git clone --recursive https://github.com/PlatformLab/arachne-all.git ${MEMCACHE_DIR}
```

2. Build the Arachne library with `./buildAll.sh` in the top level directory.
```
    cd arachne-all
    ./buildAll.sh
```
Though we use arachne-all repo, this branch only uses the PerfUtil part.

3. Build memcached-A in memcached top level directory.
```
    ./autogen.sh
    ./configure --prefix=/PATH/TO/INSTALL/DIR
    make
```

4. Then start memcached as usual:
```
    ./memcached -t 16 -c 32768 -m 10240
```
This will start a memcached service with 16 worker threads, max 32768 connections,
and 10GB memory.
