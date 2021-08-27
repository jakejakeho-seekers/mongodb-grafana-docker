#!/bin/bash
sed -i 's/3333/'"$PORT"'/' dist/server/config/default.json
cat dist/server/config/default.json
npm run server