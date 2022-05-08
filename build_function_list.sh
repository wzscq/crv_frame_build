#!/bin/sh
echo remove old temp files ...
if [ -a function_list ]; then
  rm -rf function_list
fi

echo create folder for build package ...
if [ ! -e package ]; then
  mkdir package
fi

echo get code from github
git clone https://github.com/wzscq/function_list.git

echo build the code ...
cd function_list
npm install
npm run build
cd ..

echo remove last pacakge if exist
if [ -e package/function_list ]; then
  rm -rf package/function_list
fi


mv ./function_list/build ./package/function_list


rm -rf function_list
echo function_list package build over.
