# AWS CLI用汎用作業環境

* AWS CLIおよびいくつかのツールを導入したUbuntu Xenial Dockerコンテナを構築します。
* 時計はJST, APTミラーは理化学研究所になっています。
* docker build 時に現在のUID, GIDと同じubuntuユーザを作成します。
* ubuntuフォルダを /home/ubuntu としてマウントします。
* 何もしないサーバとして sleep infinity を起動します。

# 必要なもの

* docker
* docker-compose

# 使い方

現在のUID,GIDを設定する

	echo "HGID=$(id -g)" >  .env
	echo "HUID=$(id -u)" >> .env

ビルドと起動

	docker-compose up --build -d

ubuntuユーザでログイン

	docker-compose exec work login -f ubuntu

rootユーザでログイン

	docker-compose exec work login -f root

sudoを使えばパスワードなしでubuntuユーザからrootになれます

tmux起動

	docker-compose exec -u ubuntu work sh -c 'cd && exec tmux'

終了

	docker-compose down

