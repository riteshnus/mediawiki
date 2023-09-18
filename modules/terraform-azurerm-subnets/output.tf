output "subnets_details" {
  description = "Subnet details"
  value       = azurerm_subnet.snet
}
output "vnet_subnets_id_mappings" {
  description = "The ids of subnets created inside the newly created vNet"
  value       = zipmap(keys(azurerm_subnet.snet), values(azurerm_subnet.snet)[*].id)
}
output "vnet_subnet_names" {
  description = "created subnets names"
  value       = keys(azurerm_subnet.snet)
}
output "vnet_subnets_ids" {
  description = "The ids of subnets created inside the newly created vNet"
  value       = values(azurerm_subnet.snet)[*].id
}
