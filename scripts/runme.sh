#!/bin/bash

# create argocd operator
echo now deploying argoCD
until oc apply -k https://github.com/ably77/openshift-testbed-apps/kustomize/instances/overlays/operators/namespaced-operators/argocd-operator; do sleep 2; done

# wait for argo cluster rollout
./scripts/wait-for-rollout.sh deployment argocd-server argocd 10

### deploy odh operator in argocd
echo deploying opendatahub operator
oc apply -f https://raw.githubusercontent.com/ably77/opendatahub-gitops/main/odh-argoapp.yaml

### check kafka deployment status
#echo waiting for kafka deployment to complete
#./scripts/waitfor-pod -t 20 my-cluster-kafka-2

### end
echo
echo installation complete
