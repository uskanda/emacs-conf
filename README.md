# uskanda's Emacs Configuration
__Under Construction__
__English follows Japanese__

## コンセプト
* 可搬性
Mac OS X, Linux, Windows(Cygwin)で動作可能な設定ファイルとしています。
* モジュール化
機能ごとにelispを分離し、特定機能のみを切り離して起動できるようにします。
* 頑健性
利用できない外部プログラムや依存elisp等が存在した場合でもEmacs起動が失敗しないようにします。

## 動作環境
* Emacs 23.2以上(23.1以下ではelispを追加インストールする必要があります)
* Ruby 1.9以上
* git
* 以下のOSで動作確認しています。
  * Mac OS X 10.7 Lion
  * Ubuntu 11.10
  * Windows XP SP3 (+ Cygwin)
  * Windows 7 SP1 (+ Cygwin)  

## インストールする外部プログラム
この設定ファイルのセットアップを行うと、下記外部プログラムをインストールします。

* sdic
http://www.namazu.org/~tsuchiya/sdic/index.html
* Rsense
http://cx4a.org/software/rsense/
  
## 一部機能を使用しないようにする
機能単位で使う機能/使わない機能の設定を
conf.elから行うことができます。conf.el内の説明に従い、必要のない機能をコメントアウトし、
Emacsを再起動してください。
より詳細な設定変更を行いたい場合は、confディレクトリ以下を参照してください。
conf.elにて"abc"という機能の詳細設定はconf/conf-abc.elに存在します。

## Concepts
* Portability
It works on Mac OS X, Linux and Windows(Cygwin).
* Modularity
機能ごとにelispを分離し、モジュール化する。特定機能のみを切り離して起動できる
* Robustness


## Requirements
* Emacs 23.2 or higher
* Ruby
* git

## Getting Started
1. Clone this repository and run "setup.sh"

        $ git clone git://github.com/uskanda/emacs-conf.git
        $ ./emacs-conf/setup.sh

2. Place emacs-conf in your home directory as ".emacs.d"

        $ mv emacs-conf .emacs.d
        $ mv .emacs.d ~/

    If you have some emacs configs(e.g. ".emacs", ".emacs.el", ".emacs.d") already, you should backup and move your configs first.

3. Run your Emacs

4. Enjoy!
