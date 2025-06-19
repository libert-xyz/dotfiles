## Manages PATH

# Remove duplicates
typeset -U path

# System paths (usually already set, but ensuring order)
path=('/usr/local/bin' '/usr/bin' '/bin' '/usr/sbin' '/sbin' $path)

# Homebrew (macOS)
if [[ -d '/opt/homebrew/bin' ]]; then
    path=('/opt/homebrew/bin' '/opt/homebrew/sbin' $path)
fi

# User binaries
path=("$HOME/utils/bin" "$HOME/.local/bin" $path)

# Development environments
# [[ -d "$HOME/.cargo/bin" ]] && path=("$HOME/.cargo/bin" $path)
# [[ -d "$HOME/go/bin" ]] && path=("$HOME/go/bin" $path)
# [[ -d "$HOME/.pyenv/bin" ]] && path=("$HOME/.pyenv/bin" $path)

# Export the final PATH
export PATH
