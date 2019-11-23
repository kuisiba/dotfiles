export LANG=ja_JP.UTF-8

source /usr/local/Cellar/zsh-git-prompt/0.5/zshrc.sh

autoload -Uz colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}[%~] %{$reset_color%}
%#"
RPROMPT='%b$(git_super_status)'

autoload -Uz compinit && compinit
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
#alias grep='grep --color=always --exclude='*.swp' --exclude-dir='.git''
alias ls='ls -hFG'
alias ll='ls -laG'

export VISUAL="vim"
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/Library/Java/JavaVirtualMachines/openjdk-12.jdk/Contents/Home/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.jdk/Contents/Home
export PATH=~/.local/bin:$PATH
export PATH=/Users/kuisiba/Library/Android/sdk/platform-tools:$PATH

if [[ -t 0 ]]; then
    stty stop undef
    stty stop undef
fi


