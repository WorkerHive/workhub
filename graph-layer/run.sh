mkdir ./greenlock.d
gomplate -f greenlock.template -o ./greenlock.d/config.json
git reset --hard HEAD && git pull && yarn install && node index.js
