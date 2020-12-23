#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
export dockerpath=volto/housing_prediction:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create -f housing_pod.yaml

while [[ $(kubectl get pods -l app=housing-predicitons -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "waiting for pod" && sleep 1; done

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
port="kubectl port-forward pod/housing-predicitons 8080:80"

$port &