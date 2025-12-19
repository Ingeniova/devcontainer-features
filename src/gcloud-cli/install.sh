#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive

# Install gcloud CLI in the container

apt-get update -qq
apt-get install -y apt-transport-https ca-certificates gnupg curl

# Add Google Cloud GPG key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

# Add Google Cloud repository
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list

# Install gcloud and GKE auth plugin
apt-get update -qq
apt-get install -y google-cloud-cli google-cloud-cli-gke-gcloud-auth-plugin

# Clean up
rm -rf /var/lib/apt/lists/*