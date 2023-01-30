#!/usr/bin/env bash
# Copyright 2022 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Only supports Linux

set -eux

ETCD_VERSION="${VERSION:-"3.5.5"}"

apt-get update
apt-get -y install --no-install-recommends curl tar

# Installs etcd in ./third_party/etcd
echo "Downloading source for ${ETCD_VERSION}..."

FILE_NAME="etcd-v${ETCD_VERSION}-linux-amd64.tar.gz"
curl -sSL -o "${FILE_NAME}" "https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/${FILE_NAME}"
tar xzf "${FILE_NAME}"

mv "etcd-v${ETCD_VERSION}-linux-amd64" /usr/local/etcd
rm -rf "${FILE_NAME}"

# Installs etcd in /usr/bin so we don't have to futz with the path.
install -m755 /usr/local/etcd/etcd /usr/local/bin/etcd
install -m755 /usr/local/etcd/etcdctl /usr/local/bin/etcdctl
install -m755 /usr/local/etcd/etcdutl /usr/local/bin/etcdutl
