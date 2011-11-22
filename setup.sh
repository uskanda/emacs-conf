#!/bin/sh
DIR=$(cd $(dirname $0);pwd)
VCDIR=$DIR/repos
LISPDIR=$DIR/installed

install_from_url(){
  if [ -f $LISPDIR/$2.el ]; then
    echo "file $2.el is already exists."
  else
    printf "download $2.el from $1..."
    curl -s $1/$2.el > $LISPDIR/$2.el
    echo done. 
  fi
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

cd repos
# git clone git://repo.or.cz/anything-config.git
# cd anything-config
# ln -s $VCDIR/anything-config/anything.el $DIR/installed/
# ln -s $VCDIR/anything-config/anything-config.el $DIR/installed/
# ln -s $VCDIR/anything-config/anything-match-plugin.el $DIR/installed/

if [ -d $VCDIR/popwin-el ]; then
  cd popwin-el
  printf "popwin directory is exists."
  git pull
  cd ../
else
  git clone https://github.com/m2ym/popwin-el.git 
  cd popwin-el
  ln -s $VCDIR/popwin-el/popwin.el $DIR/installed/
  cd ../
fi

if [ -d $VCDIR/rinari ]; then
  cd rinari
  printf "rinari directory is exists."  
  git pull
  cd ../
else  
  git clone https://github.com/eschulte/rinari.git
  cd rinari
  git submodule init
  git submodule update
  ln -s $VCDIR/rinari/rinari.el $DIR/installed/
  ln -s $VCDIR/rinari/util/ruby-compilation.el $DIR/installed/
  ln -s $VCDIR/rinari/util/ruby-compilation-rspec.el $DIR/installed/
  ln -s $VCDIR/rinari/util/jump/jump.el $DIR/installed/
  ln -s $VCDIR/rinari/util/jump/findr.el $DIR/installed/
  ln -s $VCDIR/rinari/util/jump/inflections.el $DIR/installed/
  cd ../
fi

if [ -d $VCDIR/auto-complete ]; then
  cd auto-complete
  printf "auto-complete directory is exists."    
  git pull
  cd ../
else
  git clone https://github.com/m2ym/auto-complete.git
  cd auto-complete
  ln -s $VCDIR/auto-complete/auto-complete.el $DIR/installed/
  ln -s $VCDIR/auto-complete/auto-complete-config.el $DIR/installed/
  ln -s $VCDIR/auto-complete/fuzzy.el $DIR/installed/
  ln -s $VCDIR/auto-complete/popup.el $DIR/installed/  
  ln -s $VCDIR/auto-complete/dict $DIR/installed/ac-dict
  cd ../
fi

if [ -d $VCDIR/js2-mode ]; then
  cd js2-mode
  printf "js2-mode directory is exists. "
  git pull
  cd ../ 
else
  git clone https://github.com/mooz/js2-mode.git
  cd js2-mode
  ln -s $VCDIR/js2-mode/js2-mode.el $DIR/installed/
  cd ../
fi

