#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build . -t volto/housing_prediction:latest

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app
docker run -it -p 8080:80 volto/housing_prediction:latest > output_txt_files/docker_out.txt