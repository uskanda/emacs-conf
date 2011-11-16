#!/bin/sh
DIR=$(cd $(dirname $0);pwd)
VCDIR=$DIR/vc
LISPDIR=$DIR/installed

install_rinari(){
  echo $DIR
  #svn co http://jp.rubyist.net/svn/rurema/doctree/trunk rubydoc
}

install_from_url(){
  echo -n download $2.el from $1...
  curl -s $1/$2.el > $LISPDIR/$2.el
  echo done. 
}

install_from_emacswiki(){
  install_from_url http://www.emacswiki.org/emacs/download/ $1
}

#requires ruby 1.9
RUBYVER=$(ruby -v)
case "$RUBYVER" in
  ruby\ 1.9* ) echo "1.9";;
  * ) echo "others";;
esac

# git clone https://github.com/m2ym/popwin-el $VCDIR/popwin-el
# echo "checkout popwin"
# ln -s $VCDIR/popwin-el/popwin.el $DIR/site-lisp
# echo "make symbolic link popwin"
if [ -e "`which git`" ]; then
  echo "git detected.";
fi

for var in `cat $DIR/setup/emacswiki_lisps`
do
install_from_emacswiki $var
done
