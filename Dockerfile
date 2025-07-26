# Use the official n8n image as base
ARG N8N_VERSION=latest
FROM docker.n8n.io/n8nio/n8n:${N8N_VERSION}

# Set working directory
WORKDIR /home/node

# Create directories for custom configurations
RUN mkdir -p /home/node/.n8n/custom


# Expose the n8n port
EXPOSE 5678

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=30s --retries=3 \
	CMD curl -f http://localhost:5678/healthz || exit 1

# Use the default entrypoint from the base image
# The base image already has the proper entrypoint and CMD configured
