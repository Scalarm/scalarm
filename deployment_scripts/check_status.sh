#!/bin/bash
# $1 - address
# e.g. ./check_status.sh "experiment manager" localhost:3000

# $1 - adress
function check {
	ADDRESS=$1
	if [ "$NAME" == "" ]; then
		NAME="status"
	fi
	STATUS=`curl -skw "%{http_code}" https://$ADDRESS/status -o /dev/null`
	if [ $STATUS == "200" ]; then
		echo -e "\033[1;32mGET https://$ADDRESS/status -> $STATUS\033[0m"
		return 0
	else
		echo -e "\033[1;31mGET https://$ADDRESS/status -> $STATUS\033[0m"
		return 1
	fi
}

check $1
exit $?
