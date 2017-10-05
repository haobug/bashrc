
#mac os
export HOMEBREW_HOME=/usr/local/opt/
export HOMEBREW_GITHUB_API_TOKEN=`~/bin/passbrew`
. ~/.bashrc.d/platform.rc
if [[ $PLATFORM == 'macos' ]];
then
    export PATH="$HOMEBREW_HOME/coreutils/libexec/gnubin:/usr/local/bin:$PATH"
    alias readlink='greadlink'
    alias ls='gls --color'
    alias df='gdf'
    # tmp_galias=`mktemp`
    # echo >$tmp_galias
    # /bin/ls /usr/local/bin/g*|while read gbin;
    # do
    #     param=""
    #     cmd_name=`basename $gbin|sed 's/^g//g'`
    #     if alias $cmd_name >/dev/null;
    #     then
    #         param=`alias $cmd_name|sed "s/'$//g"|cut -d' ' -f3`
    #     fi
    #     echo alias `basename $gbin|sed 's/^g//g'`="'$gbin' $param">>$tmp_galias;
    #     param=""
    # done && \
    # . $tmp_galias
fi
