## Set Environment variables
## Integration with system services

# Set default applications
export EDITOR="vim"
export TERMINAL="alacritty"

# Language and locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Utilities
#aws-vault
export AWS_VAULT_BACKEND="pass"
export AWS_VAULT_PASS_PREFIX=aws-vault
export AWS_VAULT_PASS_PASSWORD_STORE_DIR="$HOME/.password-store"
export AWS_SESSION_TOKEN_TTL=30m

# Platform-specific setup
case "$OSTYPE" in
    darwin*)
        # macOS
        export HOMEBREW_NO_ANALYTICS=1
        export CLICOLOR=1
        export LSCOLORS=gxExFxdxcxegedabagacad
        ;;
    linux*)
        # Linux
        export BROWSER="firefox"
        ;;
esac

# Start SSH agent if not running
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent > ~/.ssh-agent-thing
# fi
# if [[ "$SSH_AGENT_PID" == "" ]]; then
#     eval "$(<~/.ssh-agent-thing)"
# fi
