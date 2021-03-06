FROM node:8.15-alpine  AS builder

WORKDIR '/app'

COPY package*.json ./   

RUN npm install

COPY . .


RUN npm build


FROM nginx:alpine
EXPOSE 80
COPY --from=builder /app/build  /usr/share/nginx/html