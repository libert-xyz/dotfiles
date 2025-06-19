# This fix CTRL-a anf CTRL-e in tmux
bindkey -e

# Basic shell options
setopt AUTO_CD              # cd into directories by typing their name
setopt CORRECT              # spelling correction for commands
setopt HIST_IGNORE_DUPS     # ignore duplicate commands in history
setopt HIST_REDUCE_BLANKS   # remove extra blanks from history
setopt SHARE_HISTORY        # share history between sessions

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Basic prompt (customize as needed)
PS1='%n@%m:%~ %# '

# Enable completion system
autoload -Uz compinit
compinit

# aliases
source ~/.zsh_aliases

# Smart completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select

# Better history search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# Directory navigation
setopt AUTO_PUSHD           # automatically push directories onto stack
setopt PUSHD_IGNORE_DUPS    # ignore duplicate directories

# Better prompt with git info (requires git)
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PS1='%n@%m:%~${vcs_info_msg_0_} %# '

# Load colors
autoload -U colors && colors
