export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'
alias ls='ls -hFG'
alias ll='ls -laG'
alias g++='g++ -std=c++14 -Wall -Wextra'
alias cl='clang++ -std=c++14 -Wall -Wextra'
alias jobs='jobs -l'
alias tmux='tmux -u'

export PS1="\[\e[31m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\] \[\e[35m\][\[\e[m\]\[\e[33m\]\w\[\e[m\]\[\e[35m\]]\[\e[m\]\\n\$ "
export VISUAL="vim"
export PATH=$PATH:$HOME/.cargo/bin

