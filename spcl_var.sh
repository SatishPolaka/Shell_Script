#!/bin/bash

#special variables

echo "script name is $0"
echo "first argument is $1"
echo "second argument is $2"
echo "all arguments are $@"
echo "number of arguments are $#"
echo "exit status of last command is $?"
echo "process id of current shell is $$"
echo "line number of current script is $LINENO"
echo "home directory of current user is $HOME"
echo "current working directory is $PWD"
echo "user name is $USER"
echo "hostname is $HOSTNAME"
echo "random number is $RANDOM"
echo "current bash version is $BASH_VERSION"
echo "current bash pid is $BASHPID"
sleep 10 &

echo "process id of last background command is $!"
