# AWS CLI用汎用作業環境

* AWS CLIを導入したUbuntu Xenialです。
* 時計はJST, APTミラーは理化学研究所になっています。
* docker build 時に現在のUID, GIDと同じubuntuユーザを作成します。
* ubunutuフォルダを /home/ubuntu としてマウントします。

使い方

	./start.sh root
	./start.sh ubuntu


