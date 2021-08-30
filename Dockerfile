FROM nginx:1.20

COPY source/build/web /usr/share/nginx/html
