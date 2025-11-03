# SERGIO 2025-11-02
# https://github.com/ChrisTitusTech/mybash/blob/main/.bashrc

alias spico='sudo pico'
alias snano='sudo nano'
alias vim='nvim'


alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'

alias ls='ls -Fh --color=always' # add colors and file type extensions
alias lh='ls -lh'
alias lha='ls -lha'
alias labc='ls -lap'              # alphabetical sort
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only

alias lx='ls -lXBh'
alias lk='ls -lSrh'               # sort by size
alias lt='ls -ltrh'               # sort by date

alias ebrc='edit ~/.bashrc'
alias ping10='ping -c 10'
alias cls='clear'
alias cat='ccat'
alias bcat='bcat'
alias vi='nvim'
alias vim='nvim'
alias svi='sudo nvim'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'

alias grep='grep --color'

alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

