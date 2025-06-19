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

# --- Clean, colorful, git-aware prompt ---

# Load colors
autoload -U colors && colors

# Git info with vcs_info
autoload -Uz vcs_info

# vcs_info hook to show '*' if the repo is dirty
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr ' *'
zstyle ':vcs_info:git:*' unstagedstr ' *'
zstyle ':vcs_info:git:*' formats '%F{yellow} %b%u%a%f'
zstyle ':vcs_info:git:*' actionformats '%F{yellow} %b%u%a|%a%f'

precmd() { vcs_info }

# Prompt function for color and status
function set_prompt() {
  local EXIT="$?" # Save last command exit status
  local SYMBOL
  if [[ $EXIT -eq 0 ]]; then
    SYMBOL="%F{green}❯%f"
  else
    SYMBOL="%F{red}❯%f"
  fi

  PS1="%F{green}%n@%m%f:%F{blue}%~%f${vcs_info_msg_0_} $SYMBOL "
}
precmd_functions+=(set_prompt)

# aliases
source ~/.zsh_aliases

# Enable completion system
autoload -Uz compinit
compinit

# Smart completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select
