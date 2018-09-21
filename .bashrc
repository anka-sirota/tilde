
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#export WINEARCH="win32"
export EDITOR=vim
export HISTSIZE=50000
export HISTCONTROL=ignoreboth
export BROWSER="firefox"
export PYTHONSTARTUP=~/.pythonrc
export PAGER=less
alias ga='git add'
alias st='git status'
alias gf='git diff'
alias gfc='git diff --cached'
alias commit='git commit'
alias push='git push'
alias pull='git pull'
alias gckt='git checkout'

function conv_map {
    size=$1
    dir="${size}x"
    shift
    echo ${size}
    echo $@
   if [ -d $dir ]; then
      echo "Directory $dir exists. Continue?"
   else
      mkdir $dir
   fi
   for i in $@; do 
      if [ -e $i ]; then 
         convert -filter Lanczos -resize $dir\> -adaptive-sharpen 3x0.6 $i $dir/$i;
      fi
   done
}

function conv {
   if [ -d "$1x" ]; then
      echo "Directory $1x exists. Continue?"
   else
      mkdir $1x
   fi
   for i in *.{tif,jpg,jpeg,png,JPG}; do 
      if [ -e $i ]; then 
         convert -filter Lanczos -resize $1x -adaptive-sharpen 3x0.6 -bordercolor Black -border 1x1 $i $1x/$i;
      fi
   done
}

function conv_no_border {
   if [ -d "$1x" ]; then
      echo "Directory $1x exists. Continue?"
   else
      mkdir $1x
   fi
   for i in *.{tif,jpg,jpeg,png,JPG}; do 
      if [ -e $i ]; then 
         convert -filter Lanczos -resize $1x -adaptive-sharpen 3x0.6 $i $1x/$i;
      fi
   done
}

function convjpg {
   if [ -d "$1x" ]; then
      echo "Directory $1x exists. Continue?"
   else
      mkdir $1x
   fi
   for i in *.{tif,jpg,jpeg,png}; do 
      if [ -e $i ]; then 
         convert -filter Lanczos -resize $1x -adaptive-sharpen 3x0.6 -bordercolor Black -border 1x1 $i $1x/$i.jpg;
      fi
   done
}

shopt -s checkwinsize
alias ls="ls -h --color=auto"
export PS1='\[\033[1;38;5;56m\]\u@\h \[\033[00;22m\]\W \$ \[\033[00m\]'


# extra variables
#for i in `ls $HOME/.vars/.??*`; do echo "Loading $i"; . $i ; done

export PATH=$PATH:~/go/bin
export GOPATH=~/go

# reDWM
alias redwm='cd ~/dwm; updpkgsums; makepkg -fi --noconfirm && killall dwm && startx' 

export WORKON_HOME=~/.envs
export VIRTUALENVWRAPPER_PYTHON=`which python3`
source /usr/bin/virtualenvwrapper.sh

alias dock='docker exec /bin/bash -i -t '
alias 3dhubs=/home/railla/.local/venvs/3dhubs-v2/.venv/bin/3dhubs
