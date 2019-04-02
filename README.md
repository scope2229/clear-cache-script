
     ______     ______     ______     _____     __    __     _______
    /\  == \   /\  ___\   /\  __ \   /\  __-.  /\ "-./  \   /\  ____\
    \ \  __<   \ \  __\_  \ \  __ \  \ \ \/\ \ \ \ \-./\ \  \ \  __\__
     \ \_\ \_\  \ \_____\  \ \_\ \_\  \ \____-  \ \_\ \ \_\  \ \______\
      \/_/ /_/   \/_____/   \/_/\/_/   \/____/   \/_/  \/_/   \/______/




###########################################################################
###########################################################################
###########################################################################
#####                                                                 #####
#####   Developed by: Scope2229                                       #####
#####                                                                 #####
#####                                                                 #####
#####   Project: Simple script for clearing pageCache,                #####
#####            dentries and inodes along with sys file buffer       #####
#####   Date: 2/04/2019, Version: 1.0.1                               #####
#####                                                                 #####
#####   Bash script                                                   #####
#####                                                                 #####
###########################################################################
###########################################################################
###########################################################################


# This shouldn't need to be used as linux handles caching itself pretty well. 

# Sometimes, when coding applications I may have memory leaks that remain after 
# closing. This script has been used for this perpose.

# Still needs some tweaks and additions along with viewing the current state of RAM.
# Listing the top 5 ram heavy applications etc. 
# Needs more thought

# Simple script to clear the cache of a linux system
# User can use an int from 1 - 5  as a cli arg instead of running interactivly 
# Tested with Ubuntu 17.10, Ubuntu 18.04, Debian 8.11  

# The script should not be ran with sudo as an instance of root will be used by the script.
# MUID is used to asertain if the user is logged in as root.

# If no command line arg is made the script will become interactive displaying options 
# and prompting for user input.

# TODO
#       * Add error checking on cli input to make sure an int from 1 - 5 is used if not display error and 
#           exit script or start the script in interactive mode.
#       * Add error checking on the interactive user input. only INT from 1 - 5 display error prompt for user input. 
#       * Maybe add a progress indicator to show the user the script is working and hasnt crashed.
