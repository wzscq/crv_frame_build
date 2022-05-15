#!/bin/sh
echo remove old temp files ...
if [ -a crv_list_view ]; then
  rm -rf crv_list_view
fi

echo create folder for build package ...
if [ ! -e package ]; then
  mkdir package
fi

if [ ! -e package/web ]; then
  mkdir package/web
fi

echo get code from github
git clone https://github.com/wzscq/crv_list_view.git

echo build the code ...
cd crv_list_view
npm install
npm run build
cd ..

echo remove last pacakge if exist
if [ -e package/web/crv_list_view ]; then
  rm -rf package/web/crv_list_view
fi

mv ./crv_list_view/build ./package/web/crv_list_view

rm -rf crv_list_view
echo crv_list_view package build over.
