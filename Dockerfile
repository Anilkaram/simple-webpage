FROM nginx:alpine

# Remove the user directive from nginx.conf
RUN sed -i '/user/d' /etc/nginx/nginx.conf

# Create necessary directories and set proper permissions
RUN mkdir -p /var/cache/nginx/client_temp /var/run \
    && chmod -R 777 /var/cache/nginx /var/run

# Copy your custom nginx config if you have one
COPY nginx.conf /etc/nginx/nginx.conf

# Copy your application files
COPY . /usr/share/nginx/html

# Change ownership of nginx directories
RUN chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx /var/run

EXPOSE 8080
