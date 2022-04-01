#!/usr/bin/env bash

##
# compilation mediainfo sous MacOS
##

VERSION="22.03"
FILENAME=MediaInfo_CLI_${VERSION}_GNU_FromSource.tar.gz

# brew install xxx ?

if [ ! -f $FILENAME ]; then
  curl -O https://mediaarea.net/download/binary/mediainfo/${VERSION}/${FILENAME}
  tar fvxz MediaInfo_CLI_${VERSION}_GNU_FromSource.tar.gz
fi

cd MediaInfo_CLI_GNU_FromSource || exit
./CLI_Compile.sh

cp MediaInfo/Project/GNU/CLI/mediainfo ../bin/mediainfo-macos

cd ..

rm MediaInfo_CLI_${VERSION}_GNU_FromSource.tar.gz
rm -Rf ./MediaInfo_CLI_GNU_FromSource
