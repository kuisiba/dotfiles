alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'
alias ls='ls -hFG'
alias ll='ls -laG'
alias g++='g++ -std=c++14 -Wall -Wextra'
alias cl='clang++ -std=c++14 -Wall -Wextra'
alias jobs='jobs -l'

export PS1="\[\033[38;5;160m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;106m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\\$\[$(tput sgr0)\]"

export VISUAL="vim"

export PATH=$PATH:$HOME/.cargo/bin
