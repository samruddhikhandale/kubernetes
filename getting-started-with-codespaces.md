## Using Codespaces to work in the Kubernetes repository

To get started, click this [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=codespaces-devcontainer&repo=530261170&machine=premiumLinux&location=WestUs2&devcontainer_path=.devcontainer%2Fdevcontainer.json) and try out some of the commands below.

This fork is the work in progress POC for a PR to k/k ([issue](https://github.com/kubernetes/kubernetes/issues/113019)) and is intended to allow anyone creating a codespace from the config to be able to follow all the steps in the community documentation for:
  - Building: https://github.com/kubernetes/community/blob/master/contributors/devel/README.md (basically you shouldn't have to do any of the setup, you should be able to jump straight to https://github.com/kubernetes/community/blob/master/contributors/devel/development.md#building-kubernetes)
  - Testing: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-testing/testing.md
  - Releasing: https://github.com/kubernetes/sig-release/tree/master/release-engineering
If you find any gaps, please raise an [issue](https://github.com/craiglpeters/kubernetes/issues/new/choose)

## Commands to try

Build part of Kubernetes
```bash
make WHAT=cmd/kubectl
```

or build it all
```bash
make all
```

Run some integration tests to see testing working
```bash
make test-integration WHAT=./test/integration/pods GOFLAGS="-v" KUBE_TEST_ARGS="-run ^TestPodUpdateActiveDeadlineSeconds$"
```

or run them all
```bash
make test-integration
```

run conformance tests with kubetest2 and `kind`
```bash
kubetest2 kind --up --down --test=ginkgo -- --focus-regex='\[Conformance\]'
```

or maybe performance tests:
```bash
kubetest2 kind --up --down --test=ginkgo -- --focus-regex='\[Feature:Performance\]'
```

you can always run all the tests too:
```bash
kubetest2 kind --up --down --test=ginkgo
```

## Inspiration and principles

Working with very large projects like Kubernetes can be a huge challenge, especially for newcomers but also for busy people who don't dedicate themselves (and their machines) to the project full-time. Two attributes of the project contribute to becoming a productive participant: 1) the size and complexity of the codebase, and 2) the size and complexity of the community. 

- _Codebase_: The Kubernetes codebase is sprawling across many repositories, tools, dependencies, languages, and frameworks. No one can be up-to-speed on the latest accross this vast expanse. Newcomers are quickly overwhelmed and struggle with where to start. How can one move between repositories and languages once up-to-speed on one?

- _Community_: The Kubernetes community is enormous and diverse. Individuals come from many backgrounds, experiences, skill sets, and cultural perspectives. On top of that the global nature of the commmunity makes resolving confusion, problems, and questions sometimes cumbersome when crossing time zones, language barriers, etc.

### Common configuration for contribution and maintenance as a partial solution

The more each project can move configuration and depenencies from documentation to code, the fewer struggles both newcomers and maintainers who have to touch many codebases that are in flux. Additionally maintenance can benefit by moving config and dependencies from markdown to code because members of the community will no longer wonder, "Which is the source of truth?" The use of automation to test the configuration will ensure correctness. And finally, if users take advantage of tools that leverage the common configuration they won't have to fiddle with their setup, nor ask others for help for mundane configuration.

[Development Containers](https://containers.dev/) (dev containers) is an open source specification and reference CLI implementation for tying together Docker, Compose, and IDE configuration for the purposes of reusable configuration for remote development. The spec came from the desire of the VS Code team to make life easier for the emerging remote development tools to share a common way to manage configuration, and the Codespaces team's desire for a more open way to collaborate on adding and growing the specification. The two main implementors of the spec today are VS Code and GitHub Codespaces, but multiple other tools are evaluating and experimenting with adoption.

[Codespaces](https://github.com/features/codespaces) is a GitHub managed service for cloud-based development environments which uses dev containers to configure a codespace when opening a repository.

## What is in flight now

- k8s.dev training using Codespaces
- Issue in k/k for adding a dev container https://github.com/kubernetes/kubernetes/issues/113019
- Issue in Kind for adding a dev container Feature https://github.com/kubernetes-sigs/kind/issues/2967

## What might come next

- Create a PR for the dev container in k/k
- Align with sig-testing on a repo for publishing dev container Features for tools
- File issues for dev container Features for etcd, kubetest2, and anything else needed
- Finish the k8s.dev training material
- GitHub Action to build k8s releases with dev container config

## TO DO
 
 - [x]: Document the K8s process references for the configurations in the dev container
 - [x]: Document the references dev container configurations
 - [x]: Explain the principles of Codespaces and the configuration here
 - [x]: Document future work plans, current Issues
 - [x]: Add the e2e tests
 - [x]: Validate that the dev container works for locally for VS Code
 - [ ]: Update URL when this branch moves}