#Resource Group
variable "resource_group_name" {
  default = "Monitoring_Stack"
}

variable "resource_group_location" {
  default = "East US"
}

#AKS Cluster
variable "cluster_name" {
  default = "monitoring_stack_cluster"
}

variable "cluster_dns_prefix" {
  default = "monitoring"
}

variable "node_pool" {
  default = "monitoringnp"
}

variable "vm_size" {
  default = "Standard_B2als_v2"
}

#AKS Cluster Test
variable "cluster_name_test" {
  default = "monitoring_stack_cluster_test"
}

variable "cluster_dns_prefix_test" {
  default = "monitoringtest"
}

variable "node_pool_test" {
  default = "monitoringnp"
}

variable "vm_size_test" {
  default = "Standard_B2als_v2"
}

#Blob
variable "storage_account_name" {
  default = "lok1storage"
}