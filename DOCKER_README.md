# n8n Docker Setup

This Docker setup allows you to run n8n using the official `docker.n8n.io/n8nio/n8n` image as a base.

## Quick Start

### Using Docker Compose (Recommended)

1. **Start the services:**
   ```bash
   docker-compose up -d
   ```

2. **Access n8n:**
   Open your browser and go to http://localhost:5678

3. **Stop the services:**
   ```bash
   docker-compose down
   ```

### Using Docker Build and Run

1. **Build the image:**
   ```bash
   docker build -t my-n8n .
   ```

2. **Run the container:**
   ```bash
   docker run -d \
     --name n8n-container \
     -p 5678:5678 \
     -v n8n_data:/home/node/.n8n \
     my-n8n
   ```

3. **Access n8n:**
   Open your browser and go to http://localhost:5678

## Configuration

### Environment Variables

You can customize n8n by setting environment variables in the `docker-compose.yml` file:

- `N8N_BASIC_AUTH_ACTIVE`: Enable/disable basic authentication
- `N8N_BASIC_AUTH_USER`: Basic auth username
- `N8N_BASIC_AUTH_PASSWORD`: Basic auth password
- `WEBHOOK_URL`: Your webhook URL for external access
- `N8N_HOST`: Host binding (default: 0.0.0.0)
- `N8N_PORT`: Port binding (default: 5678)

### Database Configuration

The docker-compose.yml includes an optional PostgreSQL service. To use it:

1. Uncomment the database environment variables in the n8n service
2. Make sure the postgres service is enabled

### Custom Nodes

To add custom nodes:

1. Create a `custom-nodes` directory
2. Add your custom node packages
3. Uncomment the custom nodes volume mount in docker-compose.yml

### Persistent Data

Data is automatically persisted using Docker volumes:
- `n8n_data`: Contains n8n workflows, credentials, and settings
- `postgres_data`: Contains PostgreSQL database files (if using PostgreSQL)

## Security Considerations

1. **Change default credentials** if enabling basic authentication
2. **Use HTTPS** in production by setting up a reverse proxy (nginx, Traefik, etc.)
3. **Secure your database** with strong passwords
4. **Keep the base image updated** by rebuilding regularly

## Updating

To update to the latest n8n version:

1. **Pull the latest image:**
   ```bash
   docker-compose pull
   ```

2. **Rebuild and restart:**
   ```bash
   docker-compose up -d --build
   ```

## Troubleshooting

### Check logs:
```bash
docker-compose logs n8n
```

### Access container shell:
```bash
docker-compose exec n8n sh
```

### Reset data (⚠️ This will delete all workflows and data):
```bash
docker-compose down -v
docker-compose up -d
```

## Custom Configuration

You can customize the Dockerfile to:
- Install additional system packages
- Add custom environment variables
- Include custom configuration files
- Install additional Node.js packages

See the comments in the Dockerfile for examples.
