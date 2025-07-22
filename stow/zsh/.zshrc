setopt autocd                 # ディレクトリ名だけでcdする
setopt extended_history       # 履歴に実行時刻や実行時間を記録
setopt hist_expire_dups_first # 重複した履歴から先に削除
setopt hist_ignore_dups       # 直前のコマンドと同じ場合は履歴に追加しない
setopt hist_ignore_space      # 先頭にスペースがあるコマンドは履歴に残さない
setopt hist_ignore_all_dups   # 履歴全体で重複を許さない
setopt share_history          # 複数のターミナルで履歴を共有する

# history
HISTFILE="$HOME/.zsh_history" # 履歴ファイルの場所
HISTSIZE=10000                # メモリに保存する履歴の件数
SAVEHIST=10000                # ファイルに保存する履歴の件数

####################################################################################

alias vi="nvim"
alias vim="nvim"

alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."
alias dl="cd ~/downloads/"
alias cdg="cd ~/git/"

alias g="git"
alias ga="git add"
alias "ga."="git add ."
alias gcm="git commit -m"
alias st="git status"
alias gdf="git diff"

alias d="docker"
alias dcu="docker compose up"
alias dcud="docker compose up -d"
alias dcub="docker compose up --build"
alias dcudb="docker compose up -d --build"
alias dcd="docker compose down"

alias et="exit"

# eza (ls alternative)
alias ls="eza --classify=always"
alias la="eza --all --classify=always"
alias ll="eza --all --long --classify=always"
alias lsg="eza --all --long --classify=always --git"
alias tree="eza --icons=always --classify=always --tree"

alias ts="tree-sitter"

####################################################################################

bindkey -e # Emacs key bind

# ghq, fzf
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls -laph --time-style=+'%Y-%m-%d' $(ghq root)/{} | tail -n+4 | awk '{print \$6, \$7}'" --reverse)
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}

autoload -Uz ghq-fzf
zle -N ghq-fzf
bindkey '^]' ghq-fzf

# history, fzf, incremental search
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

# git switch
function select-git-switch() {
  target_br=$(
    git branch -a |
      fzf --exit-0 --layout=reverse --info=hidden --no-multi --preview-window="right,65%" --prompt="CHECKOUT BRANCH > " --preview="echo {} | tr -d ' *' | xargs git lgn --color=always" |
      head -n 1 |
      perl -pe "s/\s//g; s/\*//g; s/remotes\/origin\///g"
  )
  if [ -n "$target_br" ]; then
    BUFFER="git switch $target_br"
    zle accept-line
  fi
}
zle -N select-git-switch
bindkey "^g" select-git-switch

####################################################################################

# autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/85919cd1ffa7d2d5412f6d3fe437ebdbeeec4fc5/INSTALL.md
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax hilighting
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/5eb677bb0fa9a3e60f0eff031dc13926e093df92/INSTALL.md
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

####################################################################################

# 補完
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit && compinit
fi

####################################################################################

# starship load
eval "$(starship init zsh)"

