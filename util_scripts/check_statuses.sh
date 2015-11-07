#!/bin/bash

( ps aux | grep [m]ongod ) > /dev/null &&
	echo -e "\033[1;32mmongod -> OK\033[0m" ||
	echo -e "\033[1;31mmongod -> NOT WORKING\033[0m"

# $1 - name
# $2 - address
function check {
#	echo -n "$1 -> "
	STATUS=`curl -skw "%{http_code}" https://$2/status -o /dev/null`
	if [ $STATUS == "200" ]; then
		echo -e "\033[1;32m$1 -> $STATUS\033[0m"
	else
		echo -e "\033[1;31m$1 -> $STATUS\033[0m"
	fi
}

check "information service" localhost:11300
check "experiment manager" localhost:3001
check "storage manager" localhost:20000
check "experiment supervisor" localhost:21000
check "chart service" localhost:25000
