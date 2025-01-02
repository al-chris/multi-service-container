# Use Python base image
FROM python:3.10-slim

# Install Redis and dependencies
RUN apt-get update && apt-get install -y redis && apt-get clean

# Set the working directory
WORKDIR /app

# Copy FastAPI app
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir fastapi uvicorn redis

# Copy the wrapper script
COPY start_services.sh /start_services.sh

# Expose the FastAPI and Redis ports
EXPOSE 8000 6379

# Set the wrapper script as the default command
CMD ["/start_services.sh"]
