FROM node:14.15.1-alpine

RUN mkdir -p /front
WORKDIR /front

COPY package*.json ./
RUN npm cache clean -f
RUN apk update && apk upgrade && npm install -g vue-cli && npm install
COPY . .
RUN npm run build-production
CMD ["npm", "run", "start"]

