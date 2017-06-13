# git branch info
if [ -f /usr/local/share/gitprompt.sh ];
then
    GIT_PROMPT_THEME=Default
    . /usr/local/share/gitprompt.sh
fi

if [[ -e /usr/lib/git-core/git-sh-prompt ]];
then
    . /usr/lib/git-core/git-sh-prompt
fi

if [ -r ${HOME}/.bash/git-prompt.sh ];
then
    GIT_PROMPT_THEME=Default
    . ${HOME}/.bash/git-prompt.sh
fi

export PS1='\[\e[33;44m\]\u\[\e[m\]@\h \W$(__git_ps1 "(\[\e[1;32m\]%s\[\e[0m\])")\$ '
#export PS1='\w \$ '
