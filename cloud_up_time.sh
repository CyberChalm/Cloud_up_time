#!/bin/bash

upSeconds="$(cat /proc/uptime | grep -o '^[0-9]\+')"

if [ "${upSeconds}" -gt "3600" ]
then
	printf 'This system has been up for: %dh:%dm:%ds\n' $(($upSeconds/3600)) $(($upSeconds%3600/60)) $(($upSeconds%60))
	printf 'To prevent unnecessary costs this system will shutdown in 60 seconds. To cancel this action please type "shutdown -c"'
	sleep 60
	/sbin/shutdown -h

else
    printf 'This system has been up for: %dh:%dm:%ds\n' $(($upSeconds/3600)) $(($upSeconds%3600/60)) $(($upSeconds%60))

fi
