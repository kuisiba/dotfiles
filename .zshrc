export LANG=ja_JP.UTF-8

setopt IGNOREEOF

autoload -Uz colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

autoload -Uz compinit && compinit
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep="grep --color=always --exclude='*.swp' --exclude-dir='.git'"
case ${OSTYPE} in
    linux*)
        alias ls='ls -hF --color'
        alias ll='ls -la --color'
        ;;
    darwin*)
        alias ls='ls -hFG'
        alias ll='ls -laG'
esac

export VISUAL="vim"
export PATH=~/.local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
# for n(nodeの管理) 
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH
# for rust
export PATH=$HOME/.cargo/bin:$PATH
# for python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

case ${OSTYPE} in
    linux*)
        export GTK_IM_MODULE=fcitx
        export XMODIFIERS=@im=fcitx
        export QT_IM_MODULE=fcitx
        # ruby
        export PATH=/home/kuisiba/.gem/ruby/2.7.0/bin:$PATH
        ;;
    darwin*)
        # for clangd
        export PATH=/usr/local/opt/llvm/bin:$PATH
esac

if [[ -t 0 ]]; then
    stty stop undef
    stty stop undef
fi

# for tmux, emacs風にctrl-aで先頭に, ctrl-pでコマンド1個前etc
bindkey -e

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt EXTENDED_HISTORY
setopt share_history

# PATHの重複削除
typeset -U path PATH


eval "$(starship init zsh)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
