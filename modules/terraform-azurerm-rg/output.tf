## resource group
output "rg_id" {
  description = "resource group id"
  value = azurerm_resource_group.rg.id
}

output "rg_name" {
  description = "resource group name"
  value = azurerm_resource_group.rg.name
}

output "rg_location" {
  description = "resource group location"
  value = azurerm_resource_group.rg.location
  
}