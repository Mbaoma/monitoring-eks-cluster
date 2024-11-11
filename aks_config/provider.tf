terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.8.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "f8db0501-e2fe-49e4-abfa-e70745b53732"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false #to delete the reource group regardless if it's empty or not
    }
  }
}