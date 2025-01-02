# Use a base image with nginx and Python pre-installed
FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y nginx python3 && apt-get clean

# Copy the wrapper script into the container
COPY start_services.sh /start_services.sh

# Expose ports for nginx and Python HTTP server
EXPOSE 80 8080

# Set the wrapper script as the default command
CMD ["/start_services.sh"]
