#!/usr/bin/env bash

##
# compilation mediainfo sous CentOS 7
#
# si via docker :
# docker run --rm --mount type=bind,source=$(pwd),target=/app -w /app -it centos7 run-centos.sh
##

VERSION="22.03"
FILENAME=MediaInfo_CLI_${VERSION}_GNU_FromSource.tar.gz

yum install -y gcc-c++ make git

if [ ! -f $FILENAME ]; then
  curl -O https://mediaarea.net/download/binary/mediainfo/${VERSION}/${FILENAME}
  tar fvxz MediaInfo_CLI_${VERSION}_GNU_FromSource.tar.gz
fi

cd MediaInfo_CLI_GNU_FromSource || exit
./CLI_Compile.sh

cp MediaInfo/Project/GNU/CLI/mediainfo ../bin/mediainfo-centos

cd ..

rm MediaInfo_CLI_${VERSION}_GNU_FromSource.tar.gz
rm -Rf ./MediaInfo_CLI_GNU_FromSource
