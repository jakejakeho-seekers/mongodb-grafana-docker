FROM alpine/git as intermediate
WORKDIR /app
RUN git clone https://github.com/JamesOsgood/mongodb-grafana.git

FROM node:14
WORKDIR /app
COPY --from=intermediate /app/mongodb-grafana /app
RUN npm install
COPY commands.sh /app/
RUN ["chmod", "+x", "./commands.sh"]
ENTRYPOINT [ "./commands.sh"]
