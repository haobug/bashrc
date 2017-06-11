bashrc_path=`readlink -e ./_bashrc`
bash_dir_path=`readlink -e ./_bash`
ln -vs $bashrc_path  ~/.bashrc
set -x
ln -vs -n $bash_dir_path ~/.bash
set +x
