FROM nginx:alpine
WORKDIR app
RUN useradd -r -d /var/www/html -s /bin/false nginxuser
RUN chown -R nginxuser:nginxuser /usr/share/nginx/html
USER nginxuser
COPY index.html /usr/share/nginx/html
EXPOSE 8080
