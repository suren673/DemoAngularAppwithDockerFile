
### STAGE 1: Build ###

FROM node:latest AS build
WORKDIR /app
COPY . .

RUN npm install @angular/cli@latest -g

RUN npm run build --prod

### STAGE 2: Run ###
FROM nginx:alpine
COPY --from=build /app/dist/angular-app2Feb /usr/share/nginx/html