
FROM node:12
WORKDIR /app
COPY package*.json ./

RUN npm ci --only=production
RUN npm install -g serve

COPY . .
RUN npm run build
EXPOSE 5000
CMD ["serve", "-s",  "build"]

