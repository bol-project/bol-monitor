## build environment
FROM node:14 as builder
#COPY neo-mon/package*.json ./neo-mon/
COPY  neo-mon/. ./neo-mon/
WORKDIR ./neo-mon/
RUN npm install 
RUN chmod +x build.sh
RUN ./build.sh

##nginx-host environment
FROM nginx:alpine
# Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder ./neo-mon/dist /usr/share/nginx/html
#COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf
EXPOSE 4200 80
CMD ["nginx", "-g", "daemon off;"]
