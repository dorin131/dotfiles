# terminal prompt with git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# git aliases
alias gl='git pull'
alias gp='git push'
alias gd='git diff --color-words'
alias gc='git commit -m'
alias ga='git add'
alias gs='git status'
alias gb='git branch'
alias gco='git checkout'
alias glog='git log --pretty=format:"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]" --decorate'
