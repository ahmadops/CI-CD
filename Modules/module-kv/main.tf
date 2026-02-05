data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "Kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true
  rbac_authorization_enabled  = true
  public_network_access_enabled = true
  sku_name                    = "standard"

}

resource "azurerm_role_assignment" "kv_admin_for_user" {
  scope                = azurerm_key_vault.Kv.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}