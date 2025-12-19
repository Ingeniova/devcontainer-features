#!/usr/bin/env bash

set -e

VERSION=${VERSION:-"latest"}

# Install Kustomize in the container
# The script from kubernetes-sigs accepts [version] [target_dir]
if [ "${VERSION}" = "latest" ]; then
    curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash -s -- /usr/local/bin
else
    # Remove 'v' prefix if present for the script
    KUSTOMIZE_VERSION=${VERSION#v}
    curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash -s -- "${KUSTOMIZE_VERSION}" /usr/local/bin
fi