# Set vi mode.
set -o vi

# Load the shell dotfiles:
for file in ~/.{path,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# use python3, source mkvirtualenv
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/python/libexec/bin:$PATH

source ~/zsh-fzf-history-search.zsh

export OWL="/Users/twalla/code/owl"
eval "$("$OWL/bin/owl" init -)"

eval "$(starship init zsh)"