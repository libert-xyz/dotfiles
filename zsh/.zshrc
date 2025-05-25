#!/bin/sh

export ZDOTDIR=$HOME/.config/zsh
#export ZDOTDIR=$HOME/dotfiles/zsh/.config/zsh
HISTFILE=~/.zsh_history
setopt appendhistory

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
#stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# This fix CTRL-a anf CTRL-e in tmux
#set -g mode-keys emacs
#set -g status-keys emacs

## completions ##

# TAB COMPLETION:

autoload -Uz compinit
zstyle ':completion:*' menu select
#zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Required for web_search
zmodload zsh/langinfo

# Colors
#autoload -Uz colors && colors
autoload -U colors && colors

## Functions ##

source "$ZDOTDIR/zsh-functions"

## Normal files to source ##

zsh_add_file "zsh-exports"
#zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-alias"
zsh_add_file "zsh-prompt"

## Fuzzy Search ##

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## Plugins ##

zsh_add_file "plugins/zsh-dirhistory/dirhistory.plugin.zsh"
zsh_add_file "plugins/zsh-websearch/web-search.plugin.zsh"
#zsh_add_plugin "zsh-users/zsh-autosuggestions"
#zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
#zsh_add_plugin "zsh-users/zsh-dirhistory"

# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
#bindkey -v
#bindkey -M viins 'jj' vi-cmd-mode # jj = <esc>
#bindkey -M vicmd "v" edit-command-line # Press v in command mode to edit in vim
#bindkey -M vicmd 'k' history-substring-search-up # Search backwards in history
#bindkey -M vicmd 'j' history-substring-search-down # Search forwards in history
#bindkey '^?' backward-delete-char # Enable backspace after vicmd
#bindkey '^h' backward-delete-char

# This fix CTRL-a anf CTRL-e in tmux
bindkey -e

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line

# Environment variables set everywhere
export EDITOR="vim"

# zoxide
eval "$(zoxide init zsh)"

# Added by Windsurf
export PATH="/Users/libert/.codeium/windsurf/bin:$PATH"
