#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
export dockerpath=volto/housing_prediction:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl apply -f app_deployment.yaml

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/housing-predicitons 8080:80 &