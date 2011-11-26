#!/bin/sh
printf "setup sdic... "
wget -q http://www.namazu.org/~tsuchiya/sdic/sdic-2.1.3.tar.gz
tar jxvf sdic-2.1.3.tar.gz > /dev/null
mv sdic-2.1.3 sdic
wget -q http://www.namazu.org/~tsuchiya/sdic/data/gene95.tar.gz
mv gene95.tar.gz sdic
wget -q http://www.namazu.org/~tsuchiya/sdic/data/edict.gz
mv edict.gz sdic
rm sdic-2.1.3.tar.gz
cd sdic
./configure --with-dictdir=$EXTDIR/sdic/dict --with-lispdir=$LISPDIR
make install
make install-info
make dict
make install-dict
cd ../
echo "done."
