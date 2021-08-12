FROM node:14.15.1-alpine as build-stage

RUN mkdir -p /front
WORKDIR /front

COPY package*.json ./
RUN apk update && npm install -g @vue/cli
COPY . .
RUN npm run build
CMD ["npm", "run", "start"]

