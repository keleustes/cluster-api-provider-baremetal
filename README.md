# Cluster API Provider for Managed Bare Metal Hardware

This repository contains a Machine actuator implementation for the
Kubernetes [Cluster API](https://github.com/kubernetes-sigs/cluster-api/).

For more information about this actuator and related repositories, see
[metal3.io](http://metal3.io/).

## Development Environment

* See [metal3-dev-env](https://github.com/metal3-io/metal3-dev-env) for an
  end-to-end development and test environment for
  `cluster-api-provider-baremetal` and
  [baremetal-operator](https://github.com/metal3-io/baremetal-operator).
* [Setting up for tests](docs/dev/setup.md)
* Using [Minikube](docs/dev/minikube.md)
* Using [OpenShift 4](docs/dev/openshift.md)

## API

See the [API Documentation](docs/api.md) for details about the `providerSpec`
API used with this `cluster-api` provider.

## Deployment and examples

### Deploy Baremetal Operator CRDs and CRs

for testing purposes only, when Baremetal Operator is not deployed

```sh
    make deploy-bmo-cr
```

### Deploy CAPBM CRDs

Deploys CAPBM CRDs

```sh
    make install
```

### Run locally

Deploys CAPI, CABPK and CAPBM CRDs, runs CAPI and CABPK controllers in cluster
and runs CAPBM controller locally

```sh
    make deploy
    kubectl scale -n capbm-system deployment.v1.apps/capbm-controller-manager \
      --replicas 0
    make run
```

### Run in cluster

Deploys CAPBM CRDs and controllers in cluster

```sh
    make deploy
```

### Deploy an example

```sh
    make deploy
    make deploy-examples
```
