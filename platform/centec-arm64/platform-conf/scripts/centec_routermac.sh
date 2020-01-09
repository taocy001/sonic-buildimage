#!/bin/bash

#set routermac to config DB for centec
if [ "$1" == "init" ]; then
    python /usr/bin/centec_routermac.py
elif [ "$1" == "deinit" ]; then
    # nothing
    echo "do nothing"
else
     echo "centec_routermac : Invalid option !"
fi
