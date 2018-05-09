# Memcached-A (Under Construction)

## Note
This repo contains two major branches:
the original memcached version 1.5.6 (`master` branch);
and the memcached-A (restructured memcached with Arachne, `memcached-A` branch).

The `coreTrace` branch adds timetraces and counters on memcached 1.5.6 to record
the changes of cores, time spent on libevent turnaround and network I/O, etc.

Memcached-A is currently under construction; the unit tests may be failing.

## How do I use Memcached-A?
0. Clone this repo and switch to memcached-A branch.
```
    git clone https://github.com/PlatformLab/memcached.git ${MEMCACHE_DIR}
    cd ${MEMCACHE_DIR}
    git fetch
    git checkout memcached-A
```

1. Recursively clone [Arachne super repository](https://github.com/PlatformLab/arachne-all)
inside memcached top level directory.
```
     git clone --recursive https://github.com/PlatformLab/arachne-all.git ${MEMCACHE_DIR}/arachne-all
```

2. Build the Arachne library with `./buildAll.sh` in the top level directory.
```
    cd arachne-all
    ./buildAll.sh
```

3. Build memcached-A in memcached top level directory.
```
    ./autogen.sh
    ./configure --prefix=/PATH/TO/INSTALL/DIR
    make
```

4. Make sure the core arbiter is running in your system, if not, start it by:
```
    sudo ${MEMCACHE_DIR}/arachne-all/CoreArbiter/bin/coreArbiterServer
```
You can make it run in background.

5. Then start memcached-A, here is an example command:
```
    ./memcached --minNumCores 2 --maxNumCores 15 -t 1 -c 32768 -m 10240
```
This will start a memcached service with 1 dispatch thread, max 32768 connections,
and 10GB memory.
