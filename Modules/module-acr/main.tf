# Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name       # must be globally unique
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "Standard"            # Basic, Standard, Premium
  admin_enabled       = true               # optional: enable admin user
}