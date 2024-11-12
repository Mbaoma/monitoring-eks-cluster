# monitoring-eks-cluster
Install a monitoring stack (Grafana, Loki, Prometheus) on an Azure Kubernetes Cluster, using Helm Charts

# Cluster creation steps
- Create a Resource group using Terraform
```
terraform init
./run.sh
```

- Manually create a [container storage account](https://portal.azure.com/#browse/Microsoft.Storage%2FStorageAccounts), to use as terraform backend to store the state files remotely.

- Migrate your state files into the remote backend and create the Kubernetes cluster
```
terraform init -migrate-state
./run.sh
```

# Connecting to the AKS cluster
*You can use [K8s lens](https://k8slens.dev/download) to view deployments and created resources.*
- Connect by,
```
az account set --subscription f8db0501-e2fe-49e4-abfa-e70745b53732
az aks get-credentials --resource-group Monitoring_Stack --name monitoring_stack_cluster --overwrite-existing
```

- List all contexts
```
kubectl config get-contexts
```

- Switch to the context of the AKS cluster
```
kubectl config use-context CONTEXT_NAME
```
<img width="1680" alt="Screenshot 2024-11-07 at 15 18 26" src="https://github.com/user-attachments/assets/d099209d-7a50-4752-b556-8e945c746457">


# Monitoring setup
The idea is to have Grafana running in the ```default``` namespace of the ```aks_test``` cluster, while Loki runs in the other namespaces and ```aks_test2``` cluster.
The end result will be multiple Loki data sources feeding logs to a central Grafana dashboard.

## setup
Check the ```monitoring_stack``` folder.