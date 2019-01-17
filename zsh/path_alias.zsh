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
alias pomo="sleep 1500 && i3lock -c 212121"
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
#if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_ZSH_CONTINUATION=1
  POWERLINE_ZSH_SELECT=1
  . ~/apps/python/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
#fi
