# Setup AKS cluster with RBAC and monitoring enabled
resource "azurerm_kubernetes_cluster" "monitoring_stack_aks_test" {
  name                = var.cluster_name_test
  location            = azurerm_resource_group.monitoring-stack.location
  resource_group_name = azurerm_resource_group.monitoring-stack.name
  dns_prefix          = var.cluster_dns_prefix_test


  workload_autoscaler_profile {
    vertical_pod_autoscaler_enabled = "true"
  }


  default_node_pool {
    name                 = var.node_pool_test
    node_count           = 1 # Initial node count
    vm_size              = var.vm_size_test
    min_count            = 1 # Minimum number of nodes
    max_count            = 2 # Maximum number of nodes
    auto_scaling_enabled = "true"
  }

  role_based_access_control_enabled = true

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "calico"
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
  }
}