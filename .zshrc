# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install

## oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-syntax-highlighting colored-man-pages command-not-found extract npm starship zsh-autosuggestions auto-notify)

source $ZSH/oh-my-zsh.sh

## zoxide
eval "$(zoxide init zsh)"
alias cd=z

# AUTO_NOTIFY ZSH
export AUTO_NOTIFY_THRESHOLD=20
export AUTO_NOTIFY_TITLE="Hey! %command has just finished"
export AUTO_NOTIFY_BODY="It completed in %elapsed seconds with exit code %exit_code"
export AUTO_NOTIFY_IGNORE=("docker" "man" "sleep" "nvim")

# EDITOR
export EDITOR=nvim
alias v=nvim

# PATH
export PATH=$HOME/.local/scripts:$PATH
export PATH=$HOME/.cargo/bin:$PATH

#FZF
source $HOME/.config/fzf/config.sh

## FUCK to correct the previous command error
eval $(thefuck --alias)

## cool and useful qr utility
alias qr='qrencode -m 2 -t utf8 <<< "$1"'

## SSH
# Need to run ssh-agent as a deamon
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

## alias
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
alias mv="mv -i"
alias ls='eza --icons=always --color=always --all --git'

echo -e -n "\x1b[\x35 q" # changes to blinking bar

## KEYBINDINGS
bindkey '^y' autosuggest-accept
bindkey -s "^X" '^Cclear -x^M'
