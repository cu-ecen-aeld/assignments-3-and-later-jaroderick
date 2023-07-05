#!/bin/bash

if [ $# -lt 2 ]
then
    echo "Usage: finder.sh filesdir searchstr"
    exit 1
fi

if [ ! -d $1 ]
then
    echo "First argument is not a directory"
    exit 1
fi

X=`find $1 -type f | wc -l`
Y=`find $1 -type f -exec grep -l "$2" {} \; | wc -l`

echo "The number of files are $X and the number of matching lines are $Y"
