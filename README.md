OpenShift Operators Demo 
- Use Operator Lifecycle Management Framework
- v1 encapsulate HELM chart


Commands :
```

mkdir UiPathPortalOperator
cd UiPathPortalOperator
operator-sdk init --plugins=helm 
operator-sdk create api --group demo --version v1 --kind UiPathPortal --helm-chart ../UiPathPortalOperator/Charts/Portal/

operator-sdk init --plugins=helm  --domain=com --group demo --version v1 --kind UiPathPortal --helm-chart ../UiPathPortalOperator/Charts/Portal/

```
