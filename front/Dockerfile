FROM node:14.15.1-alpine

RUN mkdir -p /front
WORKDIR /front

COPY package*.json ./
RUN apk update && npm install -g @vue/cli
COPY . .


EXPOSE 8080
