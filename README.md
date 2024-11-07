# monitoring-eks-cluster
Install a monitoring stack (Grafana, Loki, Prometheus) on an Azure Kubernetes Cluster, using Helm Charts

# Steps
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