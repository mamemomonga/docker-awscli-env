# AWS CLI用汎用作業環境

* AWS CLIおよびいくつかのツールを導入したUbuntu Xenial Dockerコンテナを構築します。
* 時計はJST, APTミラーは理化学研究所になっています。
* docker build 時に現在のUID, GIDと同じubuntuユーザを作成します。
* ubunutuフォルダを /home/ubuntu としてマウントします。

# 必要なもの

* docker
* docker-compose

# 使い方

現在のUID,GIDを設定する

	echo "HGID=$(id -g)" >  .env
	echo "HUID=$(id -u)" >> .env

ビルド

	docker-compose build

rootユーザでbash起動

	docker-compose run --rm root


ubuntuユーザでbash起動

	docker-compose run --rm ubuntu

# 注意点

* docker-compose は専用のネットワークが作成される。終了する場合は docker-compose down

