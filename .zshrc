export LANG=ja_JP.UTF-8

setopt IGNOREEOF

autoload -Uz colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$reset_color%}%#"
#RPROMPT='%{$fg_no_bold[yellow]%}[%~]%{$reset_color%}${vcs_info_msg_0_}'

#autoload -Uz vcs_info
#setopt prompt_subst
#zstyle ':vcs_info:git:*' check-for-changes true
#zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
#zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
#zstyle ':vcs_info:*' formats " %F{green}%c%u[%b]%f"
#zstyle ':vcs_info:*' actionformats '[%b|%a]'
#precmd () { vcs_info }

autoload -Uz compinit && compinit
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep="grep --color=always --exclude='*.swp' --exclude-dir='.git'"
alias ls='ls -hFG'
alias ll='ls -laG'

export VISUAL="vim"
export PATH=$HOME/.cargo/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

if [[ -t 0 ]]; then
    stty stop undef
    stty stop undef
fi

# for tmux, ctrl-aで先頭に, ctrl-pでコマンド1個前etc
bindkey -e

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt EXTENDED_HISTORY

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

eval "$(starship init zsh)"
