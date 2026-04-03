_fatal() {
	echo "[FATAL]" $@
	exit 1
}

[ -d "/sgoinfre/babelfish/" -a -f "/sgoinfre/babelfi.sh" ] || _fatal "server not installed"

grep 'whoami >/sgoinfre/babelfish/present/$(hostname -s)' ${HOME}/.profile >/dev/null &&
	( echo "[INFO] already opted in" && exit 0 ) ||
	( printf "\n"'whoami >/sgoinfre/babelfish/present/$(hostname -s)' >>${HOME}/.profile && echo "[INFO] opted in" && exit 0 || _fatal "failed to opt in" )
