#!/usr/bin/env bash

##
# compilation mediainfo sous Debian 11
#
# si via docker :
# docker run --rm --mount type=bind,source=$(pwd),target=/app -w /app -it debian:11
##

VERSION="22.03"
FILENAME=MediaInfo_CLI_${VERSION}_GNU_FromSource.tar.gz

apt-get update && apt install -y g++ make

if [ ! -f $FILENAME ]; then
  curl -O https://mediaarea.net/download/binary/mediainfo/${VERSION}/MediaInfo_CLI_${VERSION}_GNU_FromSource.tar.gz
  tar fvxz MediaInfo_CLI_${VERSION}_GNU_FromSource.tar.gz
fi

cd MediaInfo_CLI_GNU_FromSource || exit
./CLI_Compile.sh

cp MediaInfo/Project/GNU/CLI/mediainfo ../bin/mediainfo-debian

cd ..

rm MediaInfo_CLI_${VERSION}_GNU_FromSource.tar.gz
rm -Rf ./MediaInfo_CLI_GNU_FromSource
