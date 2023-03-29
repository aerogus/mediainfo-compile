#!/usr/bin/env bash

##
# Compilation mediainfo multiplateformes
#
# Usage: ./run.sh [version]
##

declare -r ABS_PATH="$( cd "$(dirname "$0")" || return; pwd -P )"
declare -r VERSION="$1" # ex: 23.03
declare -r FILENAME="MediaInfo_CLI_${VERSION}_GNU_FromSource.tar.gz"
declare -r URL="https://mediaarea.net/download/binary/mediainfo/${VERSION}/${FILENAME}"

if [[ ! $VERSION ]]; then
  echo "Usage: run.sh [version]"
  exit 1
fi

if [[ -f "/etc/redhat-release" ]]; then
  yum install -y gcc-c++ make git
  BIN="mediainfo-centos"
elif [[ -f "/etc/debian_version" ]]; then
  apt-get update && apt install -y curl g++ make file git
  BIN="mediainfo-debian"
else
  # brew install xxx ?
  BIN="mediainfo-macos"
fi

if [[ ! -f "$FILENAME" ]]; then
  curl -O "$URL"
  tar fvxz "$FILENAME"
fi

if [[ ! -d "${ABS_PATH}/bin" ]]; then
  mkdir "${ABS_PATH}/bin"
fi

cd MediaInfo_CLI_GNU_FromSource || exit 1
./CLI_Compile.sh
cp MediaInfo/Project/GNU/CLI/mediainfo "../bin/${BIN}"
cd ..
rm "$FILENAME"
rm -Rf ./MediaInfo_CLI_GNU_FromSource
