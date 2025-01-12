#!/bin/bash

#special variables

echo "script name is $0" # script name
echo "first argument is $1" # first argument
echo "second argument is $2" # and so on
echo "all arguments are $@" # all arguments
echo "number of arguments are $#" # number of arguments
echo "exit status of last command is $?" # 0 means success, 1 means failure
echo "process id of current shell is $$"   # process id of current shell
echo "line number of current script is $LINENO"     # line number of current script
echo "home directory of current user is $HOME" # home directory of current user
echo "current working directory is $PWD" # current working directory
echo "user name is $USER" # user name
echo "hostname is $HOSTNAME" # hostname
echo "random number is $RANDOM" # random number
echo "current bash version is $BASH_VERSION" # current bash version
echo "current bash pid is $BASHPID" # current bash pid
sleep 10 & # sleep for 10 seconds

echo "process id of last background command is $!" # process id of last background command
