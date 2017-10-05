#!/bin/bash
oldwhich=`which which`
#echo $oldwhich
list_alias(){
    local name=$1
    alias $name 2>/dev/null
}

list_func(){
    local name=$1
    set |grep "$name\s*()" 2>/dev/null
}

find_name(){
    local name=$1
    find /usr/*bin/ -name $name 2>/dev/null
}

onewhich(){
    local name=$1
    list_alias $name|| \
        list_func $name|| \
        $oldwhich $name|| \
        find_name $name
}

silentwhich(){
    onewhich $@>/dev/null 2>&1
}

allwhich(){
    local name=$1
    list_alias $name;
    list_func $name;
    $oldwhich $name;
    find_name $name
}

fedorawhich(){
    silent=false
    all=false
    while test 0 -lt $#;
    do
        local name=$1
        case $name in
            -a)
                all=true
                shift
                name=$1
                allwhich $name
                ;;
            -s)
                silent=true
                shift
                name=$1
                silentwhich $name
                ;;
            *)
                if $silent;
                then
                    silentwhich $name
                elif $all;
                then
                    allwhich $name
                else
                    onewhich $name
                fi
                ;;
        esac
        shift
    done;
}

alias which='fedorawhich'
