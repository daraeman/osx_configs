export EDITOR='/usr/bin/nano';

# pidof polyfill for OSX
function pidof() {
	if [ -z "$1" ]; then
		echo 'pidof PROCESS';
		return 1;
	fi;
	ps aux | grep -v grep | grep "$1" | awk '{print $2}';
}

# Disable crontab -r
function crontab () {
	/usr/bin/crontab "${@/-r/-e}"
}

# create file and edit in editor
function edit() {
	if [ ! -f "$1" ]; then touch "$1"; fi;
	open -a Sublime\ Text "$1";
}

# write history to .bash_history immediately
shopt -s histappend;
PROMPT_COMMAND='history -a;history -n';

# redirect vim, cuz it sucks
alias vim="nano";

# copy files/dirs and delete the originals
alias move="rsync -vhr --progress --remove-source-files"

# find process(es) bound to port
function bound() {
	lsof -nP -i4TCP:$1 | grep LISTEN
}

# quick and dirty mail functions
alias clearmail='cat /dev/null > /var/mail/'"$(whoami)";
alias viewmail='cat /var/mail/'"$(whoami)";
