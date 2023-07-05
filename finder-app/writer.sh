#!/bin/bash

if [ $# -lt 2 ]
then
    echo "Usage: write.sh writefile writestr"
    exit 1
fi

if [ ! -f "$1" ]
then
    dir=`dirname $1`
    mkdir -p $dir
    touch $1
fi

echo $2 > "$1"

if [ $? -ne 0 ]
then
    echo "Could not create file"
    exit 1
fi
