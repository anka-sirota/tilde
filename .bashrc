PS1='[\u@\h \W]\$ '

#export WINEARCH="win32"
export EDITOR=vim
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth
export BROWSER="firefox"
export PYTHONSTARTUP=~/.pythonrc
export PAGER=less

# workaround EOL weirdness on terminal resize
shopt -s checkwinsize
for (( i=1; i<=$LINES; i++ )); do echo; done; clear

# git shortcuts. the rest of them are in the .gita
alias ga='git add'
alias st='git status'
alias gf='git diff'
alias gfc='git diff --cached'
alias gff='git flow feature'
alias gffs='git flow feature start'
alias gffp='git flow feature publish'
alias commit='git commit'
alias push='git push'
alias pull='git pull'
alias gckt='git checkout'

# ---- image processing helpers ----
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

function pjson {
	~/pjson.py | less -X
}

alias ls="ls -h --color=auto"
export PS1='\[\033[1;38;5;56m\]\u@\h \[\033[00;22m\]\W \$ \[\033[00m\]'


# extra variables
#for i in `ls $HOME/.vars/.??*`; do echo "Loading $i"; . $i ; done
export WORKON_HOME=~/envs
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source /usr/bin/virtualenvwrapper.sh

export PATH=$PATH:~/go/bin
export GOPATH=~/go

# reDWM
alias redwm='cd ~/dwm; updpkgsums; makepkg -fi --noconfirm && killall dwm && startx' 

# docket shortcuts
dock() {
    docker exec -it $1 bash
}
alias dock=dock
alias drmc='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias drmi='docker rmi $(docker images -a --filter=dangling=true -q)'
alias drmv='docker volume ls -qf dangling=true | xargs -r docker volume rm'
alias dcrestart='docker-compose stop; docker-compose rm -f && docker-compose up -d'
alias dcstop='docker-compose stop; docker-compose rm -f'
#

export WORKON_HOME=~/.envs
export VIRTUALENVWRAPPER_PYTHON=`which python3`
source /usr/bin/virtualenvwrapper.sh

alias 3dhubs=/home/railla/.local/venvs/3dhubs-v2/.venv/bin/3dhubs

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
complete -cf sudo
alias 3dhubs='/home/anka/.local/venvs/3dhubs-v2/.venv/bin/3dhubs'
