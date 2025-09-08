FROM nginx:alpine

# Remove the user directive from nginx.conf
RUN sed -i '/user/d' /etc/nginx/nginx.conf

# Create necessary directories and set proper permissions
RUN mkdir -p /var/cache/nginx/client_temp /var/run \
    && chmod -R 777 /var/cache/nginx /var/run

# Change NGINX to listen on port 8080 instead of 80
RUN sed -i 's/listen\(.*\)80;/listen\18080;/g' /etc/nginx/conf.d/default.conf \
    && sed -i 's/listen\(.*\):80;/listen\1:8080;/g' /etc/nginx/conf.d/default.conf

# Also update the main nginx.conf if it has listen directives
RUN sed -i 's/listen\(.*\)80;/listen\18080;/g' /etc/nginx/nginx.conf \
    && sed -i 's/listen\(.*\):80;/listen\1:8080;/g' /etc/nginx/nginx.conf

# Copy your application files
COPY index.html /usr/share/nginx/html

# Expose port 8080
EXPOSE 8080
