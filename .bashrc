# SERGIO PROMPT 2025-11-02
PS1='\[\e[38;5;37m\]\u\[\e[0m\]@\[\e[38;5;82m\]\h\[\e[0m\]:\w\$ '


### SERGIO 2025-11-02
# https://github.com/ChrisTitusTech/mybash/blob/main/.bashrc

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T " # add timestamp to history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

### FIN SERGIO ###
