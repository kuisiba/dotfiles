alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='ls -hF --color=auto'
alias g++='g++ -std=c++14 -Wall -Wextra'
alias cl='clang++ -std=c++14 -Wall -Wextra'
alias jobs='jobs -l'

#export PS1="\n\[\e[38;5;27m\]\u@\h\[\e[0m\] \[\e[38;5;77m\][$MSYSTEM]\[\e[0m\] \[\e[38;5;226m\]\w\[\e[0m\]\n\$"
export PS1="\[\033[38;5;160m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;106m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\\$\[$(tput sgr0)\]"

export VISUAL="vim"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/mnt/c/Users/kuisiba:$PATH"
