# Cloud Up Time Script

### problem

Some cloud services charge based on system up time. Where this isn't applicable it still could be considered by some, poor practise to leave publicly available development systems running 24/7

### Solution
A bash script was developed that shutdown UNIX based systems after uptime exceeded more than four hours. Users can cancel this using the shutdown -c command. The script is to be scheduled to run every two hours so cancelling the shutdown will buy the user another two hours.

The intial if statement was based on the fact I tend not to use development environments for any longer than four hours. This can easily be changed to suit your preferences.

### Setup

The script should be scheduled to run every two hours. On it's first execution it will fail to attempt to shutdown the system as uptime won't be greater than four hours. To schedule your script edit crontab -

`0 */2 * * * [sbsolute_path_to_script]/cloud_up_time.sh`

Ensure a new line character is added at the end of your entry. If this is missing UNIX will appear to laod the crontab as usual. However, the script will never run as per the post [here.](https://askubuntu.com/questions/23009/why-crontab-scripts-are-not-working)

### Addtional Information
* The file should come down from the repo with the correct permissions to execute. If the script isn't working check the permissions.
* The wall command is used to send output to the terminal as crontab doesn't support printf / echo.
* Left in 'else' condtions for testing purpose has no effect on overall script performance.
