
### STAGE 1: Build ###

FROM node:12.7-alpine AS build
WORKDIR /app
COPY . .

RUN npm install @angular/cli@latest -g

RUN npm run build --prod
### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY --from=build /app/dist/angular-app2Feb /usr/share/nginx/html