#termtitle
# If this is an xterm set the title to user@host:dir
title()
{
if readlink -f "$PWD"|grep hgfs>/dev/null; then
    echo -n "[HOST]"
fi
local titledef=`basename "$PWD"`
if echo $USER|grep hao >/dev/null; then
    echo "$titledef"
else
    if test -n $USER;
    then
        echo "[$USER]$titledef"
    fi
fi
}
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND="${PROMPT_COMMAND} echo -ne \"\033]0;\$(title \${PWD})\007\";"
    #export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

    # Show the currently running command in the terminal title:
    # http://www.davidpashley.com/articles/xterm-titles-with-bash.html
    show_command_in_title_bar()
    {
        case "$BASH_COMMAND" in
            *\033]0*)
                # The command is trying to set the title bar as well;
                # this is most likely the execution of $PROMPT_COMMAND.
                # In any case nested escapes confuse the terminal, so don't
                # output them.
                ;;
            *)
                echo -ne "\033]0;${BASH_COMMAND}\007"
                ;;
        esac
    }
    trap show_command_in_title_bar DEBUG
    ;;
*)
    ;;
esac
