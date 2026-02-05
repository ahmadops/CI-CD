module "RG" {
    source = "./Modules/module-rg"
    resource_group_name = "RG_DevOps"
    location = "eastus"
  
}

module "Kv" {
    source = "./Modules/module-kv"
    key_vault_name = "kv-devops-030"
    location = module.RG.location
    resource_group_name = module.RG.name
}

module "app_config" {
    source = "./Modules/module-app"
    identity_name = "id-devops-030"
    resource_group_name = module.RG.name  
    resource_group_location = module.RG.location
    app_configuration_name = "appconfig-devops-030"
    
}

resource "azurerm_role_assignment" "app_config_kv_access" {
  scope                = module.Kv.key_vault_id    # Key Vault resource ID
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.app_config.user_assigned_identity_principal_id  
}

module "ACR" {
    source = "./Modules/module-acr"
    container_registry_name = "acrdevops020"
    resource_group_name = module.RG.name
    resource_group_location = module.RG.location
}
