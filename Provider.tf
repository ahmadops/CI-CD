terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.50.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "5f0045cc-371f-4958-a339-1a5cccc56285"
  features {}
}
