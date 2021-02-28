FILE=./greenlock.d/config.json
if [ ! -f "$FILE" ]; then
  mkdir ./greenlock.d
  gomplate -f greenlock.template -o ./greenlock.d/config.json
fi
git pull && npm install && npm run start:server
