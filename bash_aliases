# SERGIO 2025-11-20

# Sergio Funciones
# Set variables
ACTUAL_USER=$SUDO_USER
ACTUAL_HOME=$(eval echo ~$SUDO_USER)
TEMPLATES_DIR="$ACTUAL_HOME/Templates"
LOG_FILE="/var/log/fedora_file_templates.log"

# Funtion to echo colored text
color_echo() {
    local color="$1"
    local text="$2"
    case "$color" in
        "red")     echo -e "\033[0;31m$text\033[0m" ;;
        "green")   echo -e "\033[0;32m$text\033[0m" ;;
        "yellow")  echo -e "\033[1;33m$text\033[0m" ;;
        "blue")    echo -e "\033[0;34m$text\033[0m" ;;
        *)         echo "$text" ;;
    esac
}

# Function to generate timestamps
get_timestamp() {
    date +"%Y-%m-%d %H:%M:%S"
}

countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}


# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T " # add timestamp to history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated



# View Apache logs
apachelogFun() {
	if [ -f /etc/httpd/conf/httpd.conf ]; then
		sudo cd /var/log/httpd && ls -xAh && sudo multitail --no-repeat -c -s 2 /var/log/httpd/error_log
	else
		sudo cd /var/log/apache2 && ls -xAh && sudo multitail --no-repeat -c -s 2 /var/log/apache2/error.log
	fi
}


alias apachelog='sudo apachelogFun'





# SERGIO 2025-11-02
# https://github.com/ChrisTitusTech/mybash/blob/main/.bashrc

alias web='cd /var/www/html'

# Edit this .bashrc file
alias ebrc='nano ~/.bashrc'

# Reload .bashrc file
alias reloadbrc='source ~/.bashrc'


# Edit this .bashrc.d/bash_aliases
alias ealias='nano ~/.bashrc.d/bash_aliases'
alias ealias2='subl ~/.bashrc.d/bash_aliases'


# alias to show the date
alias hoy='date "+%Y-%m-%d %A %T %Z"'


# alias to upgrade fedora
alias fupdate='sudo dnf update'
alias fkupdate='flatpak update'



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

alias dir="ls -lh"

alias lx='ls -lXBh'
alias lk='ls -lSrh'               # sort by size
alias lt='ls -ltrh'               # sort by date

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

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '


# Search command line history
alias his="history | grep "


alias grep='grep --color'

alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show open ports
alias openports='netstat -nape --inet'




# Show the current version of the operating system
ver() {
    local dtype
    dtype=$(distribution)

    case $dtype in
        "redhat")
            if [ -s /etc/redhat-release ]; then
                cat /etc/redhat-release
            else
                cat /etc/issue
            fi
            uname -a
            ;;
        "suse")
            cat /etc/SuSE-release
            ;;
        "debian")
            lsb_release -a
            ;;
        "gentoo")
            cat /etc/gentoo-release
            ;;
        "arch")
            cat /etc/os-release
            ;;
        "slackware")
            cat /etc/slackware-version
            ;;
        *)
            if [ -s /etc/issue ]; then
                cat /etc/issue
            else
                echo "Error: Unknown distribution"
                exit 1
            fi
            ;;
    esac
}


# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip () {
    # Internal IP Lookup.
    if command -v ip &> /dev/null; then
        echo -n "Internal IP: "
        ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1
    else
        echo -n "Internal IP: "
        ifconfig wlan0 | grep "inet " | awk '{print $2}'
    fi

    # External IP Lookup
    echo -n "External IP: "
    curl -4 ifconfig.me
}


