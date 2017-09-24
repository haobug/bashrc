#path settings
path_basic=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games/bin
#opt3rd=`ls  -d /opt/*/bin|less |tr '\n' ':'`
export PATH=${HOME}/bin:/usr/games:/opt/bin:$opt3rd:$PATH:$path_basic
#windows like
export PATH=.:$PATH
