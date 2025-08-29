# Use the official n8n image
FROM n8nio/n8n:latest

# Create directory for persistent data
RUN mkdir -p /home/node/.n8n

# Set working directory
WORKDIR /home/node

# Mark the n8n data folder as a volume (so you can map n8n_data)
VOLUME ["/home/node/.n8n"]

# Expose default n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
