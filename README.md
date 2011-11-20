# uskanda's Emacs Configuration
__Under Construction__
__English follows Japanese__
## Concepts
* Portability
It works on Mac OS X, Linux and Windows(Cygwin).
* Modularity
機能ごとにelispを分離し、モジュール化する。特定機能のみを切り離して起動できる
* Robustness
利用できない外部プログラムや依存elisp等が存在した場合でもEmacs起動が失敗しない

## Requirements
* Emacs 23.2 or higher
* Ruby
* git

## Getting Started
1. Clone this repository and run "setup.sh"

    git clone git://github.com/uskanda/emacs-conf.git
    ./emacs-conf/setup.sh

2. Place emacs-conf in your home directory as ".emacs.d"

    mv emacs-conf .emacs.d
    mv .emacs.d ~/

If you have some emacs configs(e.g. ".emacs", ".emacs.el", ".emacs.d") already, you should backup and move your configs first.

3. Run your Emacs

4. Enjoy!
