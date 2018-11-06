
### GIT ###

# current branch
function head-branch() {
    git rev-parse --abbrev-ref HEAD
}

# last commit message of given branch
function branch-commit-message() {
    git log --pretty=format:'%s' --date=relative master.."$1" | tail -1
}

# last commit message of current branch
function head-commit-message() {
    head-branch | branch-commit-message
}

# amends arg1 to the last commit message
function amend() { 
    git commit --amend -m "$(head-commit-message) $1"
}

# creates pull request
function pull-request() {
    echo "Creating pull request with message: $(head-commit-message)"
    git push -u origin "$(head-branch)"
    hub pull-request -m "$(head-commit-message)"
}

# amends #automerge tag and creates pull request
function pull-request-auto() {
    amend "(#am)"
    pull-request
}

# git aliases

alias cpr='pull-request'
alias cpra='pull-request-automerge'
alias gamend='git add . && git commit --amend --no-edit'
alias gs='git status '
alias ga="git add -A"
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias got='git '
alias get='git '
alias gti='git '
alias gk='gitk --all&'
alias gx='gitx --all'
alias ls='ls -G'
alias atm='atom'
alias cl='clear'

# sizes 

export HISTSIZE=1000000
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ssh-add
ssh-add -A &> /dev/null

### TeX
export PATH="/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH"

#color up iTerm
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

#ruby
source ~/.profile

#xcode
if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ]; then
    source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
fi

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export PS1=$LIGHT_GRAY'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$BLUE" \w"$GREEN": "

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin

# usage: recsim trololo.mp4
recsim() { 
    xcrun simctl io booted recordVideo "$1" 
}

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#elixir history
export ERL_AFLAGS="-kernel shell_history enabled"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sroik/go/src/unicorn-web/google/google-cloud-sdk/path.bash.inc' ]; then source '/Users/sroik/go/src/unicorn-web/google/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sroik/go/src/unicorn-web/google/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/sroik/go/src/unicorn-web/google/google-cloud-sdk/completion.bash.inc'; fi
