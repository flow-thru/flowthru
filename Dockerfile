
# Run in development mode:
# $ docker build -t flow-node .
# $ docker run -p 8080:8080 -v $(pwd):/home/node/usr/src/app flow-node npm run dev

FROM node:10-alpine
RUN mkdir -p /home/node/src/app/node_modules && mkdir -p /home/node/src/client && chown -R node:node /home/node/src/app
WORKDIR /home/node/src/app
COPY package*.json ./
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 8080
COPY . .
