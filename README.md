# Memcached-A (Under Construction)

## Note
This repo contains two major branches:
the original memcached version 1.5.6 (`master` branch);
and the memcached-A (restructured memcached-1.5.6 with Arachne, `memcached-A` branch).

The `coreTrace` branch adds timetraces and counters on memcached 1.5.6 to record
the changes of cores, time spent on libevent turnaround and network I/O, etc.

Memcached-A is currently under construction; the unit tests may be failing.

## How do I use Memcached-A?
0. Clone this repo to your target directory `${MEMCACHE_DIR}` and switch to memcached-A branch.
    ```
    git clone https://github.com/PlatformLab/memcached.git ${MEMCACHE_DIR}
    cd ${MEMCACHE_DIR}
    git fetch
    git checkout memcached-A
    ```

1. Use the `scripts/prepare.sh` to install Arachne and compile memcached-A
    ```
    ./scripts/prepare.sh
    ```
    It will automatically download Arachne and its dependencies, and build
    everything for you.

2. Make sure the core arbiter is running in your system, if not, start it by:
    ```
    sudo ${MEMCACHE_DIR}/arachne-all/CoreArbiter/bin/coreArbiterServer
    ```
    You can make it run in background.

3. Then start memcached-A, here is an example command:
    ```
    ./memcached --minNumCores 2 --maxNumCores 15 -t 1 -c 32768 -m 10240
    ```
    This will start a memcached service with 1 dispatch thread, max 32768 connections,
    and 10GB memory.
