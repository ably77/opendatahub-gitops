# Open Data Hub on OpenShift Demo w/ GitOps using ArgoCD

This repo will do the following:
- Deploy the latest Open Data Hub Community Operator
- Boostrap ArgoCD for gitops workflow
- Deploy the Open Data Hub Instances in namespace `odh`
- Deploy standard kubeflow Instance in namespace `kubeflow`


### Running the Demo using kustomize (manual)

Once logged in to an OpenShift cluster as a user with `cluster:admin` privileges, simply apply
```
oc apply -k .
```
This will deploy the demo without gitops. Doing so will cover a day 0 deployment. Managing upgrades and adding new `kfdef` modules is a manual procedure. Uninstalling will also be a manual procedure. If possible, I would recommend the approach below instead!

### Running the Demo using ArgoCD GitOps methodology

Once logged in to an OpenShift cluster as a user with `cluster:admin` privileges, run the script below:
```
./scripts/runme.sh
```
This script will bootstrap ArgoCD and deploy Open Data Hub as an ArgoCD Application. Using GitOps methodology will introduce more automation in your deployment when managing Day 2 lifecycle management activities such as adding new `kfdef` modules, upgrading, and uninstalling the deployment.

#### Where is the App Configuration?
The ArgoCD Application points to a kustomize repo libary of apps that can be found here:
(https://github.com/ably77/openshift-testbed-apps)

For now you can just leverage the default configurations set in this demo, but in the future you may look into forking this app library and repo so that you can assume full control using Git

## Navigating to Dashboards

### For ODH dashboard
From the OpenShift UI in the project `odh`, navigate to Networking --> Routes and select the odh-dashboard route URL
![](https://github.com/ably77/opendatahub-gitops/blob/main/resources/odh1.png)

![](https://github.com/ably77/opendatahub-gitops/blob/main/resources/odh2.png)

### For the kubeflow dashboard
Since kubeflow runs on istio service mesh, In the UI using the `istio-system` project, navigate to Networking --> Routes and select the Istio ingress-gateway route URL

![](https://github.com/ably77/opendatahub-gitops/blob/main/resources/kf1.png)

![](https://github.com/ably77/opendatahub-gitops/blob/main/resources/kf2.png)

### Uninstalling this Demo
If using the ArgoCD install methodology, simply run the uninstall script below and ArgoCD will handle graceful termination of all the components in this demo
```
./scripts/uninstall.sh
```



