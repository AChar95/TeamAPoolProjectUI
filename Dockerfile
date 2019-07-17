FROM node:10 as build
WORKDIR /opt/build
COPY . .
RUN NG_CLI_ANALYTICS=ci npm install -g @angular/cli
RUN NG_CLI_ANALYTICS=ci npm install
RUN ng build --prod
FROM nginx:alpine
WORKDIR /opt/app
COPY --from=build /opt/build/dist/TeamAPoolProjectUI .
COPY nginx.conf /etc/nginx/nginx.conf

