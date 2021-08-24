FROM node:14.15.1-alpine as build-stage

RUN mkdir -p /front
WORKDIR /front

COPY package*.json ./
RUN rm -rf node_modules package-lock.json && apk update && npm install -g vue-cli
COPY . .
RUN npm run build-production
CMD ["npm", "run", "start"]

