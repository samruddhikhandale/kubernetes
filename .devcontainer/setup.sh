#!/usr/bin/env bash

set -eux

# Copies over welcome message
cp .devcontainer/welcome-message.txt /usr/local/etc/vscode-dev-containers/first-run-notice.txt

python3 -m pip install --user --upgrade --no-cache-dir pyyaml

echo "Cloning kubernetes/kubectl" && mkdir -p /go/src/sigs.k8s.io && cd /go/src/sigs.k8s.io && git clone --depth=1 https://github.com/kubernetes/kubectl
echo "Cloning golang/term" && cd /go/src && git clone --depth=1 https://github.com/golang/term.git
