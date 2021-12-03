#!/bin/bash

MODE=$(grep "march" /etc/makepkg.conf | cut -d'=' -f3 | cut -d' ' -f1)

if [ $1 -e "--help" ] || [ $1 -z ];
then
echo -e "For now there is support for GCC. Clang will be unser support in the future. 
native = in specific for your CPU 
x86-64 = a generic 64bits CPU 
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

if [ $1 -e "native" ];
then
	sed -i "s/march\=$MODE/march\=native/g" /etc/makepkg.conf
fi

if [ $1 -e "x86-64" ];
then
	sed -i "s/march\=$MODE/march\=x86-64/g" /etc/makepkg.conf
fi

