# Use a base image that allows you to switch users
FROM nginx:alpine

# Copy your application code
COPY index.html /usr/share/nginx/html/index.html

# Change the ownership of the critical nginx directories to the root group
# RUN chgrp -R 0 /var/cache/nginx /var/run /var/log/nginx && \
#     chmod -R g=u /var/cache/nginx /var/run /var/log/nginx && \
#     chmod g+w /var/cache/nginx

# Optional: Specify the user (not strictly necessary but good practice)
# The user 1001 is a common non-root user in many images.
# USER 1001
