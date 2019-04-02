#!/usr/bin/env bash

# Simple script to clear the cache of a linux system
# User can use an int from 1 - 5  as a cli arg instead of running interactivly 
# Tested with Ubuntu 17.10, Ubuntu 18.04, Debian 8.11  

# The script should not be ran with sudo as an instance of root will be used by the script.
# MUID is used to asertain if the user is logged in as root.

# If no command line arg is made the script will become interactive displaying options and prompting for user input.

# TODO
# 	* Add error checking on cli input to make sure an int from 1 - 5 is used if not display error and exit script or start the script in interactive mode
#	* Add error checking on the interactive user input. only INT from 1 - 5 display error prompt for user input. 
#       * Maybe add a progress indicator to show the user the script is working and hasnt crashed.

MUID=$(id -u)

if [ x$MUID != x0 ] 
then
    #Beware of how you compose the command
    printf -v cmd_str '%q ' "$0" "$@"
    exec sudo su -c "$cmd_str"
fi

if [ $# -eq 0 ]
    then
        echo "#######################################"
        echo -e "\n"
        echo "              Clear cache              "
        echo "  Please select which caches to clear  "
        echo -e "\n"
        echo -e "#######################################\n"
        echo " 1 :: Clear PageCache only."
        echo " 2 :: Clear dentries and inodes."
        echo " 3 :: Clear PageCache, dentries and inodes."
        echo " 4 :: Flush the file system buffer."
        echo " 5 :: Exit script."
        echo " "

	read -p " Input number choice 1-5: " userInput
else
    echo -e "\n Starting with option: $1"
    userInput=$1
fi

if [ $userInput = 1 ] 
then
    sync; echo 1 > /proc/sys/vm/drop_caches
    echo -e "\n PageCache cleared.\n"
fi

if [ $userInput = 2 ]
then
    sync; echo 2 > /proc/sys/vm/drop_caches
    echo -e  "\n Cleared dentries and inodes.\n"
fi

if [ $userInput = 3 ]
then
    sync; echo > 3 /proc/sys/vm/drop_caches
    echo "Cleared PageCache, dentries and inodes.\n"
fi

if [ $userInput = 4 ]
then
    sync;
    echo -e "\n File system buffer cleared.\n"
fi

if [ $userInput = 5 ]
then
    echo -e "\n Script exited.\n"
fi
