#!/bin/sh
echo remove old temp files ...
if [ -a main_frame ]; then
  rm -rf main_frame
fi

echo create folder for build package ...
if [ ! -e package ]; then
  mkdir package
fi

echo get code from github
git clone https://github.com/wzscq/main_frame.git

echo build the code ...
cd main_frame
npm install
#sed -i  's/host=\"*.*\"/host=\"http:\/\/121.36.222.9\"/' ./public/index.html
npm run build
cd ..

echo remove last pacakge if exist
if [ -e package/main_frame ]; then
  rm -rf package/main_frame
fi


mv ./main_frame/build ./package/main_frame


rm -rf main_frame
echo main_frame package build over.
