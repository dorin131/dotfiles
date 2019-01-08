# bash line
function git_branch() {
  git_branch=$(git branch --no-color 2>/dev/null | grep \* | sed 's/* //')

  if [ $git_branch ]
  then
    white="\001\033[0;37m\002"
    yellow="\001\033[0;33m\002"
    blue="\001\033[0;34m\002"
    red="\001\033[0;31m\002"

    git_status=$(git status --porcelain 2>/dev/null)
    git_count_t=$(for i in "$git_status"; do echo "$i"; done | grep -v '^?? ' | sed '/^$/d' | wc -l | sed "s/ //g")
    git_count_color_t=$(if [ $git_count_t = "0" ]; then echo -e "$blue"; else echo -e "$red"; fi)
    git_count_ut=$(for i in "$git_status"; do echo "$i"; done | grep '^?? ' | sed '/^$/d' | wc -l | sed "s/ //g")
    git_count_color_ut=$(if [ $git_count_ut = "0" ]; then echo -e "$blue"; else echo -e "$red"; fi)

    echo -e "$white($yellow${git_branch}$white) $git_count_color_t${git_count_t}$white:$git_count_color_ut${git_count_ut}"
  fi
}

PS1="\[\e[1m\033[36m\]λ \[\e[1m\033[39m\]\w \$(git_branch) \[\033[0;36m\]\$(if [ '$UID' = 0 ]; then echo -e '#'; else echo -e '$'; fi) \[\033[0m\]"

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

# other aliases
alias ..='cd ..'
