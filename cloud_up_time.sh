#!/bin/bash

upSeconds="$(cat /proc/uptime | grep -o '^[0-9]\+')"

if [ "${upSeconds}" -gt "14400" ]
then
	printf 'This system has been up for: %dh:%dm:%ds. To prevent unnecessary costs this system will shutdown in 5 minutes. To cancel this action please type "shutdown -c"\n' $(($upSeconds/3600)) $(($upSeconds%3600/60)) $(($upSeconds%60))| wall
	sleep 300
	/sbin/shutdown -h
else
    printf 'This system has been up for: %dh:%dm:%ds\n' $(($upSeconds/3600)) $(($upSeconds%3600/60)) $(($upSeconds%60))
fi
