
# Run in development mode:
# $ docker build -t flow-node .
# $ docker run -p 8080:8080 -v $(pwd):/usr/src/app flow-node npm run dev

FROM node:10-alpine
WORKDIR /usr/src/app
COPY package*.json ./
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 8080
COPY . .