
# Run application in dev mode:
# $ docker build -t flowthru .
# $ docker run -p 3000:3000 -v $(pwd):/home/node/usr/src/app flowthru npm start

FROM node:10-alpine
RUN mkdir -p /home/node/src/app/node_modules && chown -R node:node /home/node/src/app
WORKDIR /home/node/src/app
COPY client/package*.json ./
USER node
RUN npm install
COPY --chown=node:node client .
EXPOSE 8080
COPY client .
