alias cls='clear'
#alias f='vim $(fzf)'
alias lsl='ls -l'
alias gits='git status'
alias gitl='git log'
alias getTODO="grep -r --exclude-dir=.git 'TODO:' . "
alias getFIXME="grep -r 'FIXME' ."
function gitSSH() {
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/github
    ssh -T git@github.com
}

