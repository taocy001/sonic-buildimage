#!/bin/bash

#platform init script for centec e550-24x8y2c

if [ "$1" == "init" ]; then
    #start platform monitor
    rm -rf /usr/bin/platform_routermac
    ln -s /usr/bin/24t16y_platform_routermac.py /usr/bin/platform_routermac
    python /usr/bin/platform_routermac
elif [ "$1" == "deinit" ]; then
    #kill -9 $(pidof platform_routermac) > /dev/null 2>&1
    rm -rf /usr/bin/platform_routermac
else
     echo "e550-24t16y_platform : Invalid option !"
fi
