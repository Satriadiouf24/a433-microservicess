#!/bin/bash

# Build an image based on the Dockerfile in the current directory
docker build -t karsajobs:latest .

# View the list of local images
docker images ls

# Rename the image to push it to the GitHub container registry
docker tag karsajobs-ui:latest ghcr.io/satriadiouf24/karsajobs:latest

# Log in to GitHub to push the image to the container registry
echo $REGISTRY_PASS | docker login ghcr.io -u satriadiouf24 --password-stdin

# Push the image to the GitHub Package repository
docker push ghcr.io/satriadiouf24/karsajobs:latest