#!/bin/bash

SCRIPTDIR=$(dirname $(readlink -f $0))
echo "Checking submodules ..."

for P in $SCRIPTDIR/vim/bundle/*; do

    PLUGINNAME=$(basename $P)
    echo "Checking $PLUGINNAME ..."

    if [[ ! -d "$P/.git" ]]; then
        mkdir -p $P
        git submodule init $P
        git submodule update $P
    else
        cd $P
        git pull origin master
    fi

done

echo "All Done."
