FROM node:14.15.1-alpine

RUN mkdir -p /front
WORKDIR /front

COPY package*.json ./
RUN npm cache clean -f
RUN apk update && npm install -g vue-cli
COPY . .
RUN npm run build-production
CMD ["npm", "run", "start"]

