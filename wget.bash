#!/bin/bash

USER_AGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/53.0.2785.143 Chrome/53.0.2785.143 Safari/537.36"
USER_AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36"
hewget(){
    until wget --wait=5 --random-wait -c -N --user-agent="$USER_AGENT" $@;
    do
        echo "Retrying..."
    done
}

hearia2c(){
    until aria2c -c -x9 -s9 --user-agent="$USER_AGENT" $@;
    do
        echo "aria2c Retrying..."
    done
}

aria2c_then_wget(){
    hearia2c $@||hewget $@
}
heget(){
    until aria2c_then_wget
    do
        echo "heget Retrying..."
    done
}

alias wget='hewget'
alias aria2c='hearia2c'
