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

set -e

ETCD_VERSION=${ETCD_VERSION:-3.5.5}

# Installs etcd in ./third_party/etcd
url="https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz"
download_file="etcd-v${ETCD_VERSION}-linux-amd64.tar.gz"
curl -L -o "${download_file}" "${url}"
tar xzf "${download_file}"
ln -fns "etcd-v${ETCD_VERSION}-linux-amd64" etcd
rm "${download_file}"


# Installs etcd in /usr/bin so we don't have to futz with the path.
sudo install -m755 etcd/etcd /usr/local/bin/etcd
sudo install -m755 etcd/etcdctl /usr/local/bin/etcdctl
sudo install -m755 etcd/etcdutl /usr/local/bin/etcdutl
