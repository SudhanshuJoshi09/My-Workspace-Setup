#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

#timer routine
function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  mins=$(($timer_show/60))
  secs=$(($timer_show%60))
  unset timer
}

trap 'timer_start' DEBUG
PROMPT_COMMAND=timer_stop

#export PS1='\e[0:32m[\u@\h \w] \$\e[m \e[0:31m${mins}m ${secs}s\e[m\n'
export PS1='\[$(tput setaf 7)\][\u@\h]\[$(tput setaf 4)\] \w \$ \[$(tput setaf 5)\]${mins}m ${secs}s\[$(tput sgr0)\]\n'
#export PS1="\[$(tput setaf 5)\]\u@\h:\w $ \[$(tput sgr0)\]"

# added by Anaconda3 installer
#export PATH="/home/abhi/anaconda3/bin:$PATH"
alias conda="anaconda3/bin/conda"
alias activateconda="source /anaconda3/bin/activate"
alias deactivateconda="source /anaconda3/bin/deactivate"
