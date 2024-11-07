resource "azurerm_resource_group" "monitoring-stack" {
  name     = var.resource_group_name
  location = var.resource_group_location
}