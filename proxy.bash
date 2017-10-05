#!/bin/bash

host=127.0.0.1
port=8087
sport=1080

make_http_proxy()
{
    local phost=${1:-$host}
    local pport=${2:-$port}
    echo http://${phost}:${pport}
}
make_https_proxy()
{
    local phost=${1:-$host}
    local pport=${2:-$port}
    echo https://${phost}:${pport}
}
make_socks5_proxy()
{
    local phost=${1:-$host}
    local pport=${2:-$sport}
    echo socks5://${phost}:${pport}
}
proxy_wget()
{
    echo '##wget proxy'
    proxy_nowget
cat >>~/.wgetrc<<EOWGETRC
http_proxy=`make_http_proxy`
https_proxy=`make_https_proxy`
use_proxy=yes
use_proxy=on
EOWGETRC
cat ~/.wgetrc|tail
}

proxy_nowget()
{
    sed -i -e '/_proxy/d' ~/.wgetrc
    cat ~/.wgetrc|grep _proxy || echo no proxy for wget now
}
proxy_curl()
{
    cat>>~/.curlrc<<EOCURLRC
proxy="`make_http_proxy`"
socks5="`make_socks5_proxy|cut -d'/' -f3`"
EOCURLRC
cat ~/.curlrc|tail
}
proxy_nocurl()
{
    sed -i -e '/[pP]roxy/d' -e '/socks5/d' ~/.curlrc
    cat ~/.curlrc|grep -i -e proxy -e socks || echo no proxy for curl now
}


proxy_noshell()
{
    set -x
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset socks_server
    unset no_proxy
    set +x
    echo "no show UPPER_CASE"
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset SOCKS_SERVER
    unset NO_PROXY
}

proxy_shell()
{
    echo "##shell ENV proxies"
    local phost=${1:-$host}
    local hport=${2:-$port}
    local sport=${3:-$sport}
    set -x
    export http_proxy=http://${phost}:${hport}
    export https_proxy=https://${phost}:${hport}
    export ftp_proxy=http://${phost}:${hport}
    export socks_server=${phost}:${sport}
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    set +x
    # UPPER_CASE
    echo "no show UPPER_CASE"
    export HTTP_PROXY=http://${phost}:${hport}
    export HTTPS_PROXY=https://${phost}:${hport}
    export FTP_PROXY=http://${phost}:${hport}
    export SOCKS_SERVER=${phost}:${sport}
    export NO_PROXY="localhost,127.0.0.1,localaddress,.localdomain.com"
}

proxy_nogit()
{
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    echo "## no need remove system proxy since it will be override by user global config "
    git config --list |grep proxy || echo no git proxy found,
}
proxy_git()
{
    echo '##git proxy'
    git config --global http.proxy `make_socks5_proxy`
    git config --global https.proxy `make_socks5_proxy`
    git config --list |grep proxy
}
proxy_noapt()
{
    echo -e "\t##Now global proxy to APT"
echo -e "\t change to apt config need sudo"
    sudo sed -i '/Acquire::\w*::[pP]roxy/d' /etc/apt/apt.conf|grep -i Proxy||echo No proxy in /etc/apt/apt.conf
    sudo sed -i '/Acquire::\w*::[pP]roxy/d' /etc/apt/apt.conf.d/*|grep -i Proxy||echo 'No proxy in /etc/apt/apt.conf.d/*'
}
proxy_apt()
{
    echo -e "\t##Now make proxy to APT"
    local tmpfile=/tmp/apt.conf$RANDOM
cat << EOAPTCONF >>$tmpfile
Acquire::http::Proxy "`make_http_proxy`";
Acquire::https::Proxy "`make_http_proxy`";
Acquire::socks::Proxy "`make_socks5_proxy`";
EOAPTCONF
echo -e "\t change to apt config need sudo"
cat $tmpfile |sudo tee -a /etc/apt/apt.conf && rm $tmpfile
}


#main entry
proxy()
{
    proxy_shell
    proxy_wget
    proxy_git
#    proxy_apt
    proxy_curl
}
noproxy()
{
    proxy_noshell
    proxy_nowget
    proxy_nogit
#    proxy_noapt
    proxy_nocurl
}
