export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color --exclude='*.swp' --exclude-dir='.git''
alias ls='ls -hFG'
alias ll='ls -laG'
alias g++='g++ -std=c++14 -Wall -Wextra'
alias cl='clang++ -std=c++14 -Wall -Wextra'
alias jobs='jobs -l'
alias tmux='tmux -u'

export VISUAL="vim"
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/Library/Java/JavaVirtualMachines/openjdk-12.jdk/Contents/Home/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.jdk/Contents/Home

#disable stop & start(ctrl+s, ctrl+q)
if [[ -t 0 ]]; then
    stty stop undef
    stty stop undef
fi

if [[ ! -n $TMUX ]]; then
    tmux new-session \; split-window -h -d
fi

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[30;44m\]\`parse_git_branch\`\[\e[0m\] \[\e[31m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\] \[\e[35m\][\[\e[m\]\[\e[33m\]\w\[\e[m\]\[\e[35m\]]\[\e[m\]\\n\$ "
