#!/bin/bash
set -eu

DCNTR=awscli-env
DCIMG=awscli-env
DCHST=awscli-env

DC_HOST_UID=$(id -u)
DC_HOST_GID=$(id -g)

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$BASEDIR"

DCRUNOPT="-it --rm --name $DCNTR \
	-v $(pwd)/ubuntu:/home/ubuntu \
	-h $DCHST"

case "${1:-}" in
	"build" )
		docker build -t $DCIMG \
			--build-arg HGID=$DC_HOST_GID \
			--build-arg HUID=$DC_HOST_UID \
			.
		;;

	"root" )
		docker run $DCRUNOPT \
			-w /root \
			$DCIMG 
		;;
	"ubuntu" )
		docker run $DCRUNOPT \
			-u ubuntu -w /home/ubuntu \
			$DCIMG
		;;
	* )
		echo "USAGE: $0 [ build | root | ubuntu ]"
		exit 1
		;;
esac

