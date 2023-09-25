#!/bin/bash

# Stop and remove the existing Portainer containerdocker stop portainer 
docker rm portainer 

# Pull the latest Portainer CE image
docker pull portainer/portainer-ce:latest 

# Run the Portainer container with specified options
docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest 

# Remove unused Docker images to free up disk space and prevent clutter
docker image prune -f
