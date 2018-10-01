#!/usr/bin/env bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build . -tag pboyer/teaser:latest
docker push pboyer/teaser:latest

# deploy infrastructure

cd terraform/stage
terraform init
terraform plan
terraform apply