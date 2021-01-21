
$IMG = "localcruipath.azurecr.io/portal-operator:21.01.20-v0.0.1"

# unbondleing of https://sdk.operatorframework.io/docs/building-operators/helm/quickstart/ for Windows
# run only first time - install kustomize  [require run as admin]
choco install kustomize

# Build docker image 
docker login localcruipath.azurecr.io --username <TO_BE_PROVIDED> --password <TO_BE_PROVIDED>
docker build -f .\Dockerfile -t $IMG .
docker push  $IMG

# install
kustomize build config/crd | kubectl apply -f -

# Uninstall CRDs from a cluster
kustomize build config/crd | kubectl delete -f -

# Deploy controller in the configured Kubernetes cluster in ~/.kube/config
cd config/manager && kustomize edit set image controller=${IMG}
kustomize build ..\default\ |kubectl apply -f -

# Undeploy controller in the configured Kubernetes cluster in ~/.kube/config
kustomize build config/default | kubectl delete -f -

# install verification 
# CRD : 
oc get crds | where {($_ -like "*uipath*" )}

