#!/bin/bash

WORK=25
PAUSE=5
INTERACTIVE=true
MUTE=false

DIR=/usr/lib/potato-notify
echo $DIR
show_help() {
	cat <<-END
		usage: potato [-s] [-m] [-w m] [-b m] [-h]
		    -s: simple output. Intended for use in scripts
		        When enabled, potato outputs one line for each minute, and doesn't print the bell character
		        (ascii 007)

		    -m: mute -- don't play sounds when work/break is over
		    -w m: let work periods last m minutes (default is 25)
		    -b m: let break periods last m minutes (default is 5)
		    -h: print this message
	END
}

play_notification() {
	aplay -q $DIR/notification.wav&
}

while getopts :sw:b:m opt; do
	case "$opt" in
	s)
		INTERACTIVE=false
	;;
	m)
		MUTE=true
	;;
	w)
		WORK=$OPTARG
	;;
	b)
		PAUSE=$OPTARG
	;;
	h|\?)
		show_help
		exit 1
	;;
	esac
done

time_left="%im left of %s "

if $INTERACTIVE; then
	time_left="\r$time_left"
else
	time_left="$time_left\n"
fi

while true
do
	for ((i=$WORK; i>0; i--))
	do
		m='m'
		notify-send -u normal -i $DIR/icons/work.png "$i$m left of work"
		sleep 1m
	done

	! $MUTE && play_notification
	if $INTERACTIVE; then
		read -d '' -t 0.001
		echo -e "\a"
		notify-send -u normal -i $DIR/icons/work-completed.png "Work over"
		read
	fi

	for ((i=$PAUSE; i>0; i--))
	do
		m='m'
		notify-send -u normal -i $DIR/icons/pause.png "$i$m left of pause"
		sleep 1m
	done

	! $MUTE && play_notification
	if $INTERACTIVE; then
		read -d '' -t 0.001
		echo -e "\a"
		notify-send -u critical -i  $DIR/icons/pause-completed.png "Pause over"
		read
	fi
done
