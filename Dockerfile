# Use the official n8n image
FROM n8nio/n8n:latest

# Create directory for persistent data
RUN mkdir -p /home/node/.n8n

# Set working directory
WORKDIR /home/node

# Mark the n8n data folder as a volume
VOLUME ["/home/node/.n8n"]

# Default environment variables (can be overridden on Railway)
ENV N8N_BASIC_AUTH_ACTIVE=true \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678 \
    N8N_PROTOCOL=http

# Expose default n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
