FILE=./greenlock.d/config.json
if [ ! -f "$FILE" ]; then
  mkdir ./greenlock.d
  gomplate -f greenlock.template -o ./greenlock.d/config.json
fi
git reset --hard HEAD && git pull && yarn install && node index.js
