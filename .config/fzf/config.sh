## FZF
source <(fzf --zsh)

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS="-i --height=70% --ansi"
export FZF_COMPLETION_OPTS='--border --info=inline'

## overriding default search of find with fd
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

## For custom previews
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --colors=always --all --icons=always | head -400' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {} --line-range :500 {}' "$@" ;;
  esac
}

# Custom fuzzy completion for "doge" command
#   e.g. doge **<TAB>

: '
_fzf_complete_doge() {
  _fzf_complete --multi --reverse --prompt="doge> " -- "$@" < <(
    echo very
    echo wow
    echo such
    echo doge
  )
}

## For post processing the completion list 
_fzf_complete_doge_post() {
  awk '{print $NF}'
}
'

source $HOME/.config/fzf/fzf-git.sh

unalias gco
gco() {
  _fzf_git_each_ref --no-multi | xargs git checkout
}
