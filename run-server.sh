#!/bin/bash

# based on https://github.com/beardedio/dcon-terraria, which is
# subject to the MIT License, found in file "MIT" and is Copyright (c)
# Brandon Skrtich

cd /usr/server
# --server --gc=sgen -O=all
TORUN="mono TerrariaServer.exe -configpath /config -worldpath /worlds -logpath /config"

if [ ! -z "$world" ];
then
    if [ ! -f "/worlds/$world" ];
    then
        echo "FATAL: '/worlds/$world' does not exist."
        exit
    fi
    TORUN="$TORUN -world /worlds/$world"
fi

echo "$TORUN $@"
exec $TORUN $@
    
    

