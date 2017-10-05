export HISTFILESIZE=998
export HISTSIZE=$HISTFILESIZE
# Avoid duplicates
#export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# append and reload history after every command
export PROMPT_COMMAND="history -a; history -c;history -r; ${PROMPT_COMMAND:-true;}"
