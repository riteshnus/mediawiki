output "vm_public_ip" {
  value     = module.vm.linux_vm_public_ip["linux-ae"]
  sensitive = true
}

output "mssql_server_fqdn" {
  value = module.asql.asql_server_fqdn
}

output "mssql_db_user" {
  value     = data.azurerm_key_vault_secret.admin_username
  sensitive = true
}

output "mssql_db_password" {
  value     = data.azurerm_key_vault_secret.admin_password
  sensitive = true
}

output "mssql_db_name" {
  value = var.asql_databases[0]
}
