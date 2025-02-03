<<<<<<< HEAD
export ZDOTDIR=$HOME/.config/zsh
=======
#!/usr/bin/env zsh

# Make vim the default editor.
export EDITOR='vim';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Increase history size.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Fancy bat manpager
export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"

# Trim long directory paths.
export PROMPT_DIRTRIM=3

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);

# set SSH_AUTH_SOCKET for yubikey
export SSH_AUTH_SOCK=$HOME/.ssh/ykpiv-sock

# set GOTMPDIR
export GOTMPDIR=/usr/local/go/tmp
>>>>>>> 7098e1e (new laptop :))
