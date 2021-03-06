#!/bin/bash

if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

cd $WORKHUB_FS

rm webui.zip
wget https://github.com/WorkerHive/hub/releases/download/$WEBUI_VERSION/webui.zip
rm -rf web-ui/*
rm -rf packages/
unzip webui.zip 'packages/web-ui/build/*'
mv packages/web-ui/build/* web-ui
rm -rf packages/