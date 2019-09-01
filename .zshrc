# shortcut
alias sbp='source ~/.bash_profile'
alias cp='cp -p'
alias ll='ls -laG'
alias ls='ls -G'
alias mk='touch'
alias gi='gem install'


setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
fpath=(path/to/zsh-completions/src $fpath)
#peco
function peco-history-selection() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection
bindkey -e
# zsh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
# node
export PATH=$PATH:/Users/shotaro/.nodebrew/current/bin
# mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
# zprofile
source ~/.zprofile

## Go 環境設定
if [ -x "`which go`" ]; then
    export GOPATH=$HOME/dev/go_page
    export PATH=$PATH:$GOPATH/bin
fi

export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"

# git補完
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -u
