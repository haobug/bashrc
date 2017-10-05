readlink -f `which thefuck`>/dev/null || pip3 install --user thefuck
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)
eval $(thefuck --alias zdc)
eval $(thefuck --alias wtf)
