grep_param='--color -rn --exclude-dir=.git --exclude-dir=.svn --exclude-dir=lang  --exclude-dir=po'
function jgrep()
{
    find . -type f -name "*\.java" -print0 | xargs -0 grep ${grep_param} "$@"
}

function cgrep()
{
    find . -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name 'Makefile' -o -name 'configure' \) -print0 | xargs -0 grep ${grep_param} "$@"
}

function resgrep()
{
    for dir in `find . -name res -type d`; do find $dir -type f -name '*\.xml' -print0 | xargs -0 grep --color -n "$@"; done;
}

function prep()
{
	grep ${grep_param} $@
}