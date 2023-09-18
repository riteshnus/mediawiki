output "akv_id_value" {
  value = {
    for k, akv in azurerm_key_vault.akv : k => akv.id
  }
}

output "akv_id" {
  value = azurerm_key_vault.akv
}
