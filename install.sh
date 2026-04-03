_fatal() {
	echo "[FATAL]" $@
	exit 1
}

[ -d "/sgoinfre/babelfish/" -a -f "/sgoinfre/babelfi.sh" ] || _fatal "server not installed"

case "$SHELL" in
	*zsh)
		echo "[INFO] zsh detected"
		if zsh -c ". ${HOME}/.zshrc && type bbl" >/dev/null; then
			echo "[INFO] babelfish already installed, no need to install again"
			exit 0
		fi
		echo "[INFO] appending '. /sgoinfre/babelfi.sh' to ${HOME}/.zshrc..."
		printf "\n. /sgoinfre/babelfi.sh\n" >>${HOME}/.zshrc
		echo "[INFO] installation complete, please reload your configuration (i.e: 'exec zsh' or '. ~/.zshrc')"
		echo "[INFO] to get started, run 'bbl list'"
		;;
	*bash)
		echo "[INFO] bash detected"
		if bash -c ". ${HOME}/.bashrc && type bbl" >/dev/null; then
			echo "[INFO] babelfish already installed, no need to install again"
			exit 0
		fi
		echo "[INFO] appending '. /sgoinfre/babelfi.sh' to ${HOME}/.bashrc..."
		printf "\n. /sgoinfre/babelfi.sh\n" >>${HOME}/.bashrc
		echo "[INFO] installation complete, please reload your configuration (i.e: 'exec bash' or '. ~/.bashrc')"
		echo "[INFO] to get started, run 'bbl list'"
		;;
	*) _fatal "unsupported shell detected, please try again with bash or zsh" ;;
esac
