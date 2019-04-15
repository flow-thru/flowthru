
FROM node:10-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
EXPOSE 8080
COPY . .

# Run in development mode
# $ docker build -t flow-node .
# $ docker run -p 8080:8080 -v $(pwd):/usr/src/app flow-node npm run dev