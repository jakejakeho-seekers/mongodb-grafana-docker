#!/bin/bash
sed 's/3333/'"$PORT"'/' dist/server/config/default.json
npm run server