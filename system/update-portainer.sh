#!/usr/bin/env bash

# exit if things get weird
set -e

# pull image and capture output
PULL_OUTPUT=$(sudo docker pull portainer/portainer-ce:latest)

# if docker pulls a new image, restart portainer
if ! echo "$PULL_OUTPUT" | grep -q "Image is up to date"; then
  echo "New image detected. Restarting Portainer..."

  sudo docker stop portainer
  sudo docker rm portainer
  sudo docker run -d \
    -p 8000:8000 \
    -p 9443:9443 \
    --name=portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    "$IMAGE"

  sudo docker image prune -f
else
  echo "Portainer image is already up to date. Nothing to do."
fi
