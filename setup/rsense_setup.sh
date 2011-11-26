#!bin/sh
echo "To use Rsense, please set the environment variable RSENSE as $REPOSDIR/rsense in your shell configuration. (e.g. 'export RSENSE_HOME=\"$REPOSDIR/rsense\"')"
chmod +x bin/rsense
ruby etc/config.rb > ~/.rsense
wget http://www.ruby-lang.org/ja/man/archive/ruby-refm-1.9.2-dynamic-20110629.tar.gz
tar jxvf ruby-refm-1.9.2-dynamic-20110629.tar.gz
mv ruby-refm-1.9.2-dynamic-20110629 refm
