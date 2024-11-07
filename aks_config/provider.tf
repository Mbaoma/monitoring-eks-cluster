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
  features {}
}