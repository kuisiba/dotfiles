 alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'
 alias grep='grep --color'                     # show differences in colour
 alias egrep='egrep --color=auto'              # show differences in colour
 alias fgrep='fgrep --color=auto'              # show differences in colour
 alias ls='ls -hF --color=auto'                 # classify files in colour
alias g++='g++ -std=c++14 -Wall -Wextra'
alias cl='clang++ -std=c++14 -Wall -Wextra'
alias jobs='jobs -l'

#bashのプロンプト設定(nightskyとおなじ)
#\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[35m\]$MSYSTEM\[\e[0m\] \[\e[33m\]\w\[\e[0m\]\n\$"
#export PS1="\n\[\e[38;5;27m\]\u@\h\[\e[0m\] \[\e[38;5;77m\][$MSYSTEM]\[\e[0m\] \[\e[38;5;226m\]\w\[\e[0m\]\n\$"

export PS1="\[\033[38;5;160m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;106m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\\$\[$(tput sgr0)\]"
eval `dircolors $HOME/.dir_colors` #lsの色設定読み込み

export VISUAL="vim"

export PATH=$PATH:/c/Users/kuisiba/.rustup/toolchains/nightly-x86_64-pc-windows-gnu/lib/rustlib/x86_64-pc-windows-gnu/lib/
export PATH=$PATH:/c/Users/kuisiba/.cargo/bin
export PATH=$PATH:/c/"Program Files"/nodejs
export PATH=$PATH:/c/Users/kuisiba/AppData/Roaming/npm
