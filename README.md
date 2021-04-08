# Open Data Hub Demo w/ GitOps

This repo will do the following:
- Deploy the latest Open Data Hub Community Operator
- Boostrap ArgoCD for gitops workflow
- Deploy the Open Data Hub Instances in namespace `odh`
- Deploy standard kubeflow Instance in namespace `kubeflow`

### Running the Demo

Once logged in as a user with `cluster:admin` privileges, simply run the command below:
```
./scripts/runme.sh
```

## Navigating to Dashboards

### For ODH dashboard
From the OpenShift UI in the project `odh`, navigate to Networking --> Routes and select the odh-dashboard route URL
![](https://github.com/ably77/opendatahub-gitops/blob/main/resources/odh1.png)

![](https://github.com/ably77/opendatahub-gitops/blob/main/resources/odh2.png)

### For the kubeflow dashboard
Since kubeflow runs on istio service mesh, In the UI using the `istio-system` project, navigate to Networking --> Routes and select the Istio ingress-gateway route URL

![](https://github.com/ably77/opendatahub-gitops/blob/main/resources/kf1.png)

![](https://github.com/ably77/opendatahub-gitops/blob/main/resources/kf2.png)


