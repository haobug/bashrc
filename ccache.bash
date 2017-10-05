ccdir=$HOME/.ccache
mkdir -p $ccdir
export CCACHE_DIR=$ccdir
#export CCACHE_DIR="/var/tmp/ccache"
export USE_CCACHE=1
export CCACHE_SIZE="50G"
#ccache -M $CCACHE_SIZE
#ccache -s
export PATH=/usr/lib/ccache:$PATH
