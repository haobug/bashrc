run_cmd()
{
    local cmd=$@
    local tmpfile=/tmp/cmd$RANDOM.cmd
    echo $cmd>$tmpfile
    $tmpfile
}
ln_win()
{
    set -x
    shift # remove -s 1st arg
    local src=$1
    local dst=$2
    if [[ -d $src ]];
    then
        cmd="mklink /D $dst $src"
    else
        cmd="mklink $dst $src"
    fi
    run_cmd $cmd
    set +x
}
echo $OS|grep -i windows && alias ln='ln_win'
echo "WIP ln on win32 need a path convert"
