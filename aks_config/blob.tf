# resource "azurerm_storage_account" "loki_storage" {
#   name                     = var.storage_account_name
#   resource_group_name      = azurerm_resource_group.monitoring-stack.name
#   location                 = azurerm_resource_group.monitoring-stack.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_storage_container" "loki_container" {
#   name                  = "content"
#   storage_account_name  = azurerm_storage_account.loki_storage.name
#   container_access_type = "blob" #"private"
# }