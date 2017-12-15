#!/bin/bash
set -eu

function server_stop {
	echo ""
	echo "SERVER STOP"
	exit 0
}

function server_start {
	echo "SERVER START"
	sleep infinity & wait
}

trap server_stop TERM
server_start

