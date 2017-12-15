FROM ubuntu:xenial

RUN set -xe && \
	rm /etc/localtime && \
	ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
	echo 'Asia/Tokyo' > /etc/timezone && \
	sed -i.bak 's#http://archive.ubuntu.com/ubuntu#http://ftp.riken.go.jp/Linux/ubuntu#g' /etc/apt/sources.list

RUN set -xe && \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		gosu sudo git vim openssh-server git awscli tmux sudo \
		inetutils-ping inetutils-traceroute dnsutils \
		curl wget jq

ARG HGID
ARG HUID

RUN set -xe; \
 	if [ -z "$(cat /etc/group | awk -F: '{print $3}' | grep ${HGID})" ]; then \
 		groupadd -g ${HGID} ubuntu; \
 	fi; \
 	if [ -z "$(cat /etc/passwd | awk -F: '{print $3}' | grep ${HUID})" ]; then \
 		useradd -g ${HGID} -u ${HUID} -s /bin/bash ubuntu; \
 	fi

RUN set -xe && \
	echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/wheel_user && \
	chmod 600 /etc/sudoers.d/wheel_user

ADD assets/ /
ENTRYPOINT ["/entrypoint.sh"]

