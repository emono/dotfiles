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
# path
export PATH="$PATH:/bin:/usr/bin:/usr/local/bin"
# zsh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
# node
export PATH=$HOME/.nodebrew/current/bin:$PATH
# mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
# zprofile
source ~/.zprofile
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# git補完
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -u

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/shoutaro/.nodebrew/node/v9.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/shoutaro/.nodebrew/node/v9.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/shoutaro/.nodebrew/node/v9.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/shoutaro/.nodebrew/node/v9.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/shoutaro/.nodebrew/node/v9.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/shoutaro/.nodebrew/node/v9.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh