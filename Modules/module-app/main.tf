
resource "azurerm_user_assigned_identity" "identity" {
  name                = var.identity_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

data "azurerm_client_config" "current" {}

resource "azurerm_app_configuration" "app_config" {
  name                       = var.app_configuration_name
  resource_group_name        = var.resource_group_name
  location                   = var.resource_group_location
  sku                        = "standard"
  local_auth_enabled         = true
  public_network_access      = "Enabled"
  purge_protection_enabled   = false
  soft_delete_retention_days = 1

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.identity.id,
    ]
  }
}

