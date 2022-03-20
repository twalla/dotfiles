# Homebrew exports.
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Asdf exports.
source $(brew --prefix asdf)/libexec/asdf.sh

# Add GNU coreutils to the $PATH.
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

source $ZDOTDIR/aliases
source $ZDOTDIR/functions

# ZSH Options
setopt HIST_SAVE_NO_DUPS    # Don't save duplicates in the history file.

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd

bindkey -v		    # Enable Vim mode.
export KEYTIMEOUT=1         # Make switching modes quicker.

setopt extendedglob	    # Enable extended globbing.
unsetopt CASE_GLOB	    # Enable case insensitive globbing.

# FZF History Search
[ -f $ZDOTDIR/zsh-fzf-history-search.zsh ] && source $ZDOTDIR/zsh-fzf-history-search.zsh

# Starship Prompt
eval "$(starship init zsh)"
