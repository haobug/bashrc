#!/bin/bash
#gitclone
function gitclone()
{
    url=$1
    folder=$2
    if [ -z $folder ];
    then
        bname=`basename $url`
        folder=`filename $bname`
    fi
    cd ~/src
    git clone $url $folder
    cd $folder
}
wgetzip()
{
    br=$2
    if [ -z $br ];
    then
        br="master"
    fi
    url="$1/archive/$br.zip"
    zip=$3
    if [ -z $zip ];
    then
        zip=`echo $url|sed 's|http.*://github.com/[^/]*/\([^/]*\)/[^/]*/\([^/]*\)|\1-\2|g'`
    fi
    echo $zip
    cd ~/src && \
    until wget -c $url -O $zip; do sleep 0.1; done;
    unzip -o $zip
    cd `filename $zip`
    git init && git add . && git commit -m 'zip initial'
    git lg -n1
    update_gradule
    update_gradule_plugin 2.2.0
}

function srcclone()
{
    wgetzip $@ || gitclone $@
}
