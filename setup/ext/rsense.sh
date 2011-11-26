#!bin/sh
#rsense https://github.com/m2ym/rsense.git ("etc/rsense") ("sh $DIR/setup/rsense_setup.sh")
cd $EXTDIR
wget http://cx4a.org/pub/rsense/rsense-0.3.tar.bz2
tar jxvf rsense-0.3.tar.bz2
mv rsense-0.3 rsense
cd rsense
echo "To use Rsense, please set the environment variable RSENSE as $EXTDIR/rsense in your shell configuration. (e.g. 'export RSENSE_HOME=\"$EXTDIR/rsense\"')"
chmod +x bin/rsense
ruby etc/config.rb > ~/.rsense
wget http://www.ruby-lang.org/ja/man/archive/ruby-refm-1.9.2-dynamic-20110629.tar.gz
tar jxvf ruby-refm-1.9.2-dynamic-20110629.tar.gz
mv ruby-refm-1.9.2-dynamic-20110629 refm
ln -s $EXTDIR/rsense/etc/rsense.el $LISPDIR
cd ../
