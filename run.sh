#!/usr/bin/env bash

set -ex

mkdir -p -m 777 /data/models
docker run --runtime nvidia --gpus all -d -p 80:80 -v /data/models:/app/stable-diffusion-webui -e COMMANDLINE_ARGS="--xformers --listen --port 80 --api --api-log --api-auth username:password" stable-diffusion-api
