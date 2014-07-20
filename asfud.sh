#!/bin/sh

WATCH_DIR=$1/
SSH_PATH=$2/
URL_BASE=$3

SAVEIFS=$IFS
IFS="
"
echo $IFS

echo $WATCH_DIR
echo $SSH_PATH
echo $URL_BASE

NOTIFY=$(which notify-send)

while inotifywait -e close_write $WATCH_DIR; do
  FILE=$(dir -t -1 --quoting-style=literal  $WATCH_DIR | head -n 1)
  FILE_WITHOUT_SPACES=$(echo $FILE | sed 's/ //g')
  sleep 1
  LOCAL_FILE=$WATCH_DIR$FILE
  chmod 644 $LOCAL_FILE
  scp$IFS-p$IFS$LOCAL_FILE$IFS$SSH_PATH$FILE_WITHOUT_SPACES
  URL=$URL_BASE$FILE_WITHOUT_SPACES
  echo $URL | xclip -i -selection clipboard
  if [ "$NOTIFY" != "" ] ; then
    notify-send "Screenshot upload" "Link copied to clipboard\n$URL"
  fi
  rm $LOCAL_FILE
done

IFS=$SAVEIFS
