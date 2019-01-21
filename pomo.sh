#!/bin/bash
#simple pomodoro script
interval=4; 
workDuration=$((25*60));
stdBreak=$((5*60));
lngBreak=$((20*60));
message=''
notify="zenity --info --text="
if (! which zenity 2&1> /dev/null) ; then echo "Zenity must be installed" && exit 1 ; fi
while (/bin/true); do
	for i in $(seq 1 4); do
		sleep $workDuration
		if [[ $i -eq 4 ]]; then
			message="Take a $lngBreak"
		else 
			message="Take a $stdBreak"
		fi
		$notify"$message"
	done
	sleep $lngBreak ; 
		message="Back to work"
		$notify"$message"
done

