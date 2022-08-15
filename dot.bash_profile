# Keep stty commands in .bash_profile because they may cause errors
# in .bashrc, as experienced by myself and mentioned in a comment here
#
# https://askubuntu.com/questions/725200/error-found-when-loading-home-myusername-profile

stty -ixon
