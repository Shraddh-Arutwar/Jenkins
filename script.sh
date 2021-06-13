#!/bin/bash 

NAME=$1
LNAME=$2
Username=$3
SHOW=$4

if [ "$SHOW" = "true" ];then
	echo "Hello $1 $2"
	echo "your user access level is: $3"
else
	echo "Hello $1 $2"
	echo "We can not show your userlevel"
fi
