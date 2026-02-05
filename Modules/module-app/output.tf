# In your module's outputs.tf
output "user_assigned_identity_principal_id" {
  value       = azurerm_user_assigned_identity.identity.principal_id
}
