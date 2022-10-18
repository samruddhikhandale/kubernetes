## Using Codespaces to work in the Kubernetes repository

To get started, click this [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=master&repo=530261170&machine=standardLinux32gb&location=WestUs2) {TO DO: Update URL when this branch moves}

Build part of Kubernetes
```bash
make WHAT=cmd/kubectl
```

or build it all
```bash
make all
```

Run some tests to see testing working
```bash
make test-integration WHAT=./test/integration/pods GOFLAGS="-v" KUBE_TEST_ARGS="-run ^TestPodUpdateActiveDeadlineSeconds$"
```

Or run them all
```bash
make test-integration
```

> Note: the VS Code UI will show some errorr related to port permissions, but the tests should run without an issue anyway. Working on identifying and resolving the issue around the errors.

