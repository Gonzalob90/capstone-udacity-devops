#!/usr/bin/env bash

image_tag=udacity-capstone-project

# Build image and add tag
docker build --tag=$image_tag .

# Run app
docker run -p 5000:5000 $image_tag