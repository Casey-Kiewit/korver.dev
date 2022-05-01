FROM node AS build
WORKDIR /website

COPY *.json .
RUN npm ci

COPY . .
RUN npm run build


FROM nginx:stable-alpine

COPY --from=build /website/build /usr/share/nginx/html
