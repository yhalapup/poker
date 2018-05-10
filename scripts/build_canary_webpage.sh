#!/usr/bin/env bash
set -e # Exit on error

cd ~

tar -xvf scm_artifact.tar
ls -l

# If an argument was passed, assume it was a timestamp to be used
if [ ! -z "$1" ]; then
  DATESTRING="-d @${1}"
fi

YEAR=`date $DATESTRING -u +%Y`
MONTH=`date $DATESTRING -u +%m`
DAY=`date $DATESTRING -u +%d`
TIME=`date $DATESTRING -u +"%k:%M:%S UTC"`
SECONDS=`date $DATESTRING -u +%s`

sed "s/year not set/$YEAR/g" scm_artifact/index.html
sed "s/month not set/$MONTH/g" scm_artifact/index.html
sed "s/day not set/$DAY/g" scm_artifact/index.html
sed "s/time not set/$TIME/g" scm_artifact/index.html
sed "s/seconds not set/$SECONDS/g" scm_artifact/index.html

cat scm_artifact/index.html

exit 1
