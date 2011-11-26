#!/bin/sh
DIR=$(cd $(dirname $0);pwd)
export REPOSDIR=$DIR/repos
export EXTDIR=$DIR/ext
export EXTSETUPDIR=$DIR/setup/ext
export LISPDIR=$DIR/installed

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

while getopts "cs" flag; do
  case $flag in
    \?) OPT_ERROR=1; break;;
    c) opt_c=true;;
    s) opt_s=true;;
  esac
done

if [ $OPT_ERROR ]; then
  echo >&2 "usage: $0 [-cs]"
  exit 1
fi

if [ $opt_c ]; then
    while :
    do
    printf "Clear all the install files? [y/n]"
	read ans
	case $ans in
	    [yY]) break ;;
	    [nN]) echo "exit."; exit 1 ;;
	esac
    done
    printf "Remove repositories in $REPOSDIR... "
    find $REPOSDIR ! -name ".gitignore" ! -regex "$REPOSDIR" | xargs rm -rf   
    echo "done."
    printf "Remove files and symbolic links in $LISPDIR... "
    find $LISPDIR ! -name ".gitignore" ! -regex "$LISPDIR" | xargs rm
    echo "done."
    exit 1
fi

#requires ruby 1.9
RUBYVER=$(ruby -v)
case "$RUBYVER" in
  ruby\ 1.9* ) echo "1.9";;
  * ) echo "others";;
esac

if [ -e "`which git`" ]; then
  echo "git detected.";
fi

for var in `cat $DIR/setup/emacswiki_lisps`
do
install_from_emacswiki $var
done

cd $REPOSDIR
#get elisps from git repository
while read GITNAME GITURI GITELISPSSTR GITSUBCOMMANDSSTR
do
eval GITELISPS=$GITELISPSSTR;
eval GITSUBCOMMANDS=$GITSUBCOMMANDSSTR;
if [ -d $REPOSDIR/$GITNAME ]; then
    if [ $opt_s ]; then
	echo "$GITNAME directory already exists. skip this Elisp."
    else 
	cd $GITNAME
	printf "$GITNAME directory already exists. check update... "
	git pull
	cd ../
    fi
else
    git clone $GITURI
     cd $GITNAME
    for (( i = 0; i < ${#GITSUBCOMMANDS[@]}; i++ ))
    do
      ${GITSUBCOMMANDS[i]}
    done
    for (( i = 0; i < ${#GITELISPS[@]}; i++ ))
    do
      ln -s $REPOSDIR/$GITNAME/${GITELISPS[i]}.el $LISPDIR
    done
    cd ../
fi
done < $DIR/setup/git_lisps
cd $DIR

cd $EXTDIR
for file in $EXTSETUPDIR/*.sh
do
  dirname=`basename ${file} .sh`
  if [ -d $EXTDIR/$dirname ]; then
    if [ $opt_s ]; then
      echo "$dirname directory already exists. skip this external program."
    fi
  else 
    sh $file
  fi
done
cd $DIR
