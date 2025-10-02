# This fix CTRL-a anf CTRL-e in tmux
bindkey -e

# Basic shell options
setopt AUTO_CD              # cd into directories by typing their name
setopt CORRECT              # spelling correction for commands
setopt HIST_IGNORE_DUPS     # ignore duplicate commands in history
setopt HIST_REDUCE_BLANKS   # remove extra blanks from history
setopt SHARE_HISTORY        # share history between sessions

# Directory navigation
setopt AUTO_PUSHD           # automatically push directories onto stack
setopt PUSHD_IGNORE_DUPS    # ignore duplicate directories

setopt PROMPT_SUBST

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Better history search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# aliases
source ~/.zsh_aliases

# Enable completion system
autoload -Uz compinit
compinit

# Smart completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"
