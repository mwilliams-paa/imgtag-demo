FROM nginx:alpine

COPY index.html /usr/share/nginx/html/
COPY entropy /usr/share/nginx/html/
