FROM node:8.15-alpine  AS builder

WORKDIR '/app'

COPY package*.json ./   

RUN yarn install

COPY . .


RUN yarn run full-install


FROM nginx:alpine
EXPOSE 80
COPY --from=builder /app/build  /usr/share/nginx/html