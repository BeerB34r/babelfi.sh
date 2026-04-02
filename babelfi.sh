#/usr/bin/env bash

MAILBOX='/sgoinfre/babelfish/'
MYMAILBOX=$MAILBOX"`whoami`/"

mkdir --mode=777 -p $MYMAILBOX

appendMailpath() {
	if [ -z "$MAILPATH" ]; then
		MAILPATH=$1?$2
	else
		MAILPATH=$1?$2:${MAILPATH}
	fi
}
appendMailpath $MYMAILBOX '[sgoinfre] Youve got mail from `stat --format="%U" $_`'$'\n''"`cat $_`"`\rm -f $_`'
appendMailpath $MAILBOX'present' '$(grep -E "`test -z "${FRIENDS}" && echo -n "" || echo "${FRIENDS}|"`harl" $_ >/dev/null 2>/dev/null &&
									echo "[present] `cat $_` is here!" ||
									printf "\033[A")'
announcePresence() {
	if [ "$1" ]; then
		echo "$1" >$MAILBOX'present/'`hostname -s`
	else
		whoami >$MAILBOX'present/'`hostname -s`
	fi
}
MAILCHECK="1"
