#!/bin/bash
# This uninstall script will only work for the argo deployment

# delete argo apps
oc delete applications -n argocd --all

# delete argocd cluster
oc delete -k https://github.com/ably77/openshift-testbed-apps/kustomize/instances/overlays/operators/namespaced-operators/argocd-operator

# delete CSVs
oc delete csv -n openshift-operators --all

# Switch to default project
oc project default

# delete CRDs
oc delete crd sparkapplications.radanalytics.io sparkclusters.radanalytics.io sparkhistoryservers.radanalytics.io
oc delete crd seldondeployments.machinelearning.seldon.io 
oc delete crd kfdefs.kfdef.apps.kubeflow.org