#! /bin/sh
#
# Sample events script for mcabber
# Use OSD to display events on the user's desktop
#
# To use this script, set the "events_command" option to the path of
# the script (see the mcabberrc.example file for an example)
#
# MiKael, 2006-01-07

# XOSD_CMD_PIPE='osd_cat --pos=bottom --align=center --delay=4 --color=magenta --font=-*-courier-*-*-*-*-14-*-*-*-*-*-iso8859-15'
XOSD_CMD_PIPE='osd_cat --pos=bottom --align=right --delay=4 --color=white --font=-*-terminal-*-*-*-*-14-*-*-*-*-*-iso8859-15 --outline=15 --age=4'
XOSD_CMD_PIPE_MUC='osd_cat --pos=bottom --align=right --delay=4 --color=green --font=-*-terminal-*-*-*-*-14-*-*-*-*-*-iso8859-15 --outline=15 --age=4'

event=$1
arg1=$2
arg2=$3
filename=$4
# Note that the 4th argument is only provided for incoming messages
# and when 'event_log_files' is set.

if [[ $event == "MSG" ]]; then
  case "$arg1" in
    IN)
      # Incoming message from buddy $arg2
      echo "You have an IM from <$arg2>" | $XOSD_CMD_PIPE > /dev/null 2>&1
      if [ -n "$filename" -a -f "$filename" ]; then
        # We could process filename here...
        /bin/rm $filename
      fi
      ;;
    MUC)
      # Groupchat message in room $arg2
      echo "MUC <$arg2>" | $XOSD_CMD_PIPE_MUC > /dev/null 2>&1
      if [ -n "$filename" && -f "$filename" ]; then
        # We could process filename here...
        /bin/rm $filename
      fi
      ;;
    OUT)
      # Outgoing message for buddy $arg2
      ;;
  esac
elif [[ $event == "STATUS" ]]; then
  # Buddy $arg2 status is $arg1 (_, O, I, F, D, N, A)
  #echo "<$arg2> has changed status to: [$arg1]" | $XOSD_CMD_PIPE > /dev/null 2>&1
  echo > /dev/null
fi

