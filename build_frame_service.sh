#!/bin/sh
echo remove old temp files ...
if [ -a frame_service ]; then
  rm -rf frame_service
fi

echo create folder for build package ...
if [ ! -e package ]; then
  mkdir package
fi

echo get code from github
git clone https://github.com/wzscq/frame_service.git

echo build the code ...
cd frame_service
go build
cd ..


echo remove last pacakge if exist
if [ ! -e package/frame_service ]; then
  mkdir package/frame_service
fi

if [ -e package/frame_service/frame ]; then
  rm -rf package/frame_service/frame
fi

mv ./frame_service/frame ./package/frame_service/frame

rm -rf frame_service
echo frame_service package build over.
