#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
# .xinitrc

xrdb -merge $HOME/.Xresources
export BROWSER="firefox"
export EDITOR=vim
#export WINEARCH="win32"
export LC_ALL="en_US.UTF-8"
export SSH_ASKPASS=/usr/lib/ssh/ssh-askpass

#xxkb&
xbindkeys
xrandr --dpi 107 &

setxkbmap us
setxkbmap -option grp:caps_toggle us,ru
sh ~/.fehbg &
redshift -P -O 2800 &
#exec wmii

# Statusbar loop
while true; do
    $HOME/.statusbar
done &

eval $(ssh-agent)

trayer --expand true --widthtype request --transparent true --alpha 255 --edge top --align right &
exec dwm
