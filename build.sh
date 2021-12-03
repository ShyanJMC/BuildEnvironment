#!/bin/bash

MODE=$(grep "march" /etc/makepkg.conf | cut -d'=' -f3 | cut -d' ' -f1)

if [ "$1" = "--help" ];
then
echo -e "For now there is support for GCC. Clang will be unser support in the future. 
native = in specific for your CPU 
64b = a generic 64bits x86-64 CPU

Until GCC 12.1 the ARM native support for ARMv9 will not under support.
For now ARM support is not working, will be in the future.

armv8-a = Armv8-A 
armv8.1-a = Armv8.1-A 
armv8.2-a = Armv8.2-A 
armv8.3-a = Armv8.3-A
armv8.4-a = Armv8.4-A
armv8.5-a = Armv8.5-A 
armv8.6-a = Armv8.6-A
armv8.7-a = Armv8.7-A 
armv9-a = Armv9-A 
armv8-r = Armv8-R "
fi

if [ "$1" = "native" ];
then
        sed -i "s/march\=$MODE/march\=native/g" /etc/makepkg.conf
fi

if [ "$1" = "64b" ];
then
        sed -i "s/march\=$MODE/march\=x86-64/g" /etc/makepkg.conf
fi

