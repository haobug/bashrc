godir_get_realpath()
{
    readlink -f "$1"
}

godir_get_dirname()
{
    godir_get_realpath `dirname "$1"`
}
godir()
{
    local dst=$1
    local dst_dir="~"
    if [[ -d $dst ]];
        then
        dst_dir=$dst
    else
        dst_dir=`dirname $dst`
    fi
    cd $dst_dir
}

cdnew()
{
    cd `ls -tr|tail -n1`
}
# alias cd='godir'