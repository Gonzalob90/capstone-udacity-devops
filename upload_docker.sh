#!/usr/bin/env bash

# 1. Create dockerpath
dockerpath=gonzalob90/udacity-capstone-project

# 2. Authenticate & tag
docker login
docker tag udacity-capstone-project $dockerpath
echo "Docker ID and Image: $dockerpath"

# Push image to a docker repository
docker push $dockerpath