export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export PATH="/home/michael/apps/kitty/bin:$PATH"
export PATH="$HOME/bin:$PATH"


source "$HOME/apps/python/bin/activate"
alias vim=nvim
alias vi=nvim


alias ssh="zssh -Y"
export PATH="$PATH:~/bin/"
export PATH=$PATH:~/.linuxbrew/Cellar/parallel/20170622/bin/
export PATH=$PATH:~/apps/anaconda3/bin/
export PATH=~/apps/anaconda3/bin:$PATH
export PATH=$PATH:/usr/lib/go-1.9/bin
export PATH=$HOME/.cargo/bin:$PATH
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
export PATH="/home/jyq/anaconda3/bin:$PATH"
#if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_ZSH_CONTINUATION=1
  POWERLINE_ZSH_SELECT=1
  . ~/apps/python/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
#fi

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

alias pomo="sleep 1500 && i3lock -c 212121"
function pom(){   
    timew start
    sleep 1500
    timew stop
    brightness=$(light)
    light -S 0.6
    sleep 300
    light -S $brightness
}
