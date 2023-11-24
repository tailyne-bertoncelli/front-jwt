FROM node: latest as build
WORKDIR /ust/local/app
COPY J/usr/localapp/
RUN npm install
RUN npm run build
FROM nginx;latest
COPY -from=build /usr/local/app/dist/hello-world/browser /usr/share/nginx/himl
EXPOSE 80