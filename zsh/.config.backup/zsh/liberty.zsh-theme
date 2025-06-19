###!/usr/bin/env zsh
#!/bin/sh

# Inspired by
# Sergei Kolesnikov
# https://github.com/win0err/aphrodite-terminal-theme

# ------------------------------------------------------------------------------
#
# Liberty Terminal Theme
# Author: Libert R Schmidt
#
# ------------------------------------------------------------------------------

## autoload vcs and colors
#autoload -U colors && colors

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{9}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%f%F{11}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

liberty_get_welcome_symbol() {

	echo -n "%(?..%F{1})"
	
	local welcome_symbol='$'
	[ $EUID -ne 0 ] || welcome_symbol='#'
	
	echo -n $welcome_symbol
	echo -n "%(?..%f)"
}

function __git_prompt_git() {
  GIT_OPTIONAL_LOCKS=0 command git "$@"
}

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ "$(__git_prompt_git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ "${DISABLE_UNTRACKED_FILES_DIRTY:-}" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    case "${GIT_STATUS_IGNORE_SUBMODULES:-}" in
      git)
        # let git decide (this respects per-repo config in .gitmodules)
        ;;
      *)
        # if unset: ignore dirty submodules
        # other values are passed to --ignore-submodules
        FLAGS+="--ignore-submodules=${GIT_STATUS_IGNORE_SUBMODULES:-dirty}"
        ;;
    esac
    STATUS=$(__git_prompt_git status ${FLAGS} 2> /dev/null | tail -n 1)
  fi
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

liberty_get_current_branch() {

	local branch=$(git_current_branch)
	
	if [ -n "$branch" ]; then
		echo -n $ZSH_THEME_GIT_PROMPT_PREFIX
		echo -n $(parse_git_dirty)
		echo -n "‹${branch}›"
		echo -n $ZSH_THEME_GIT_PROMPT_SUFFIX
	fi
}

check_aws_profile() {
	if [[ ! -z "$AWS_PROFILE" ]]; then
	  echo -n "%F{11} <$AWS_PROFILE>%f"
	fi
}

liberty_get_prompt() {

	# 256-colors check (will be used later): tput colors
	
	#echo -n "%F{9}%n%f" # User
	echo -n "%F{10} %~" # Dir
	echo -n "$(liberty_get_current_branch)" # Git branch
	echo -n "$(check_aws_profile)"
	echo -n "%F{11} > %f" # > 
	#echo -n "\n"
	#echo -n "$(liberty_get_welcome_symbol)%{$reset_color%} " # $ or #
}

export GREP_COLOR='1;31'

PROMPT='$(liberty_get_prompt)'
