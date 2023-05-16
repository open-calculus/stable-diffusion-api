#!/usr/bin/env bash

# https://docs.docker.com/engine/install/
# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html

set -ex

curl -fsSL https://get.docker.com | sh

systemctl enable docker

curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | \
    gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

curl -fsSL https://nvidia.github.io/libnvidia-container/experimental/$(source /etc/os-release; echo $ID$VERSION_ID)/libnvidia-container.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

apt update && apt install -y nvidia-container-toolkit

nvidia-ctk runtime configure --runtime=docker

systemctl restart docker
