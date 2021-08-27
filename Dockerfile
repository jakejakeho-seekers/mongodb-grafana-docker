FROM alpine/git as intermediate
WORKDIR /app
RUN git clone https://github.com/JamesOsgood/mongodb-grafana.git

FROM node:14
WORKDIR /app
COPY --from=intermediate /app/mongodb-grafana /app
RUN npm install
ENTRYPOINT [ "sed 's/3333/$PORT/' app/mongodb-grafana/dist/server/default.json && npm run server"]
