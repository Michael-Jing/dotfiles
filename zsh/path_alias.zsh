export PATH="$HOME/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/Android/Sdk/platform-tools/"

alias vim=nvim
alias vi=nvim


alias ssh="ssh -Y"
alias zssh="zssh -Y"
export PATH=$HOME/.cargo/bin:$HOME/.gem/ruby/2.6.0/bin/:$PATH
# alias geth="geth-173"

alias in='task add +in'
tickle () {
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}
alias tick=tickle
alias think='tickle +1d'


export PS1='$(task +in +PENDING count) '$PS1

# added by Anaconda3 4.3.1 installer
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_COMMAND="fd --type d"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export VISUAL=nvim
export EDITOR="$VISUAL"
function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

alias pomo="sleep 1500 && swaylock -f -c 000000"
function pom(){   
    timew start
    sleep 1500
    timew stop
    brightness=$(light)
    light -S 0.6
    sleep 300
    light -S $brightness
}

