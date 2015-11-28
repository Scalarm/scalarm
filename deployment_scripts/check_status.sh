#!/bin/bash
# $1 - address
# $2 - name (optional
# e.g. ./check_status.sh "experiment manager" localhost:3000

# $1 - adress
# $2 - name (optional
function check {
	ADDRESS=$1
	NAME=$2
	if [ "$NAME" == "" ]; then
		NAME="status"
	fi
	STATUS=`curl -skw "%{http_code}" https://$ADDRESS/status -o /dev/null`
	if [ $STATUS == "200" ]; then
		echo -e "\033[1;32m$NAME -> $STATUS\033[0m"
		return 0
	else
		echo -e "\033[1;31m$NAME -> $STATUS\033[0m"
		return 1
	fi
}

check $1 $2
exit $?
