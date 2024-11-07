terraform {
  backend "azurerm" {
    resource_group_name  = "Monitoring_Stack"
    storage_account_name = "monitoringstack1storage"
    container_name       = "monitoringstack1storagec0nta1ner"
    key                  = "monitoring-stack/terraform.tfstate"
  }
}