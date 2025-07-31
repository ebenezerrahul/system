# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install


export TZ=IST-5:30

# PATH
export PATH=$HOME/.local/scripts:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/home/ebenezerrahul/.spicetify

## oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-syntax-highlighting colored-man-pages command-not-found extract npm starship zsh-autosuggestions auto-notify)
source $ZSH/oh-my-zsh.sh

# wal config
wal -R >> /dev/null

# AUTO_NOTIFY ZSH
export AUTO_NOTIFY_THRESHOLD=20
export AUTO_NOTIFY_TITLE="Hey! %command has just finished"
export AUTO_NOTIFY_BODY="It completed in %elapsed seconds with exit code %exit_code"
export AUTO_NOTIFY_IGNORE=("docker" "man" "sleep" "nvim")

# EDITOR
export EDITOR=nvim
alias v=nvim
alias vim=nvim

#FZF
source $HOME/.config/fzf/config.sh

## FUCK to correct the previous command error
eval $(thefuck --alias)

## cool and useful qr utility
alias qr='qrencode -m 2 -t utf8 <<< "$1"'

## alias
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
alias mv="mv -i"
alias ls='eza --icons=always --color=always --all --git'

echo -e -n "\x1b[\x35 q" # changes to blinking bar

#autoenv
source ~/.autoenv/activate.sh

## KEYBINDINGS
bindkey '^y' autosuggest-accept
bindkey -s "^X" '^Cclear -x^M'

if [[ ! -v XDG_RUNTIME_DIR ]] then
    XDG_RUNTIME_DIR=$HOME
fi

## add ssh-agent socket
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [ ! -f "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

## zoxide
eval "$(zoxide init zsh)"
alias cd=z
