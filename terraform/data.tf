data "azurerm_key_vault_secret" "vm_admin_username" {
  provider     = azurerm.environment
  name         = "vmUser"
  key_vault_id = lookup(module.akv.akv_id_value, var.environment[0])
}
data "azurerm_key_vault_secret" "vm_admin_password" {
  provider     = azurerm.environment
  name         = "vmPassword"
  key_vault_id = lookup(module.akv.akv_id_value, var.environment[0])
}
data "azurerm_key_vault_secret" "admin_username" {
  provider     = azurerm.environment
  name         = "sqlUser"
  key_vault_id = lookup(module.akv.akv_id_value, var.environment[0])
}
data "azurerm_key_vault_secret" "admin_password" {
  provider     = azurerm.environment
  name         = "sqlPassword"
  key_vault_id = lookup(module.akv.akv_id_value, var.environment[0])
}
