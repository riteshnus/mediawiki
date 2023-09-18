output "asql_server_id" {
  value = azurerm_mssql_server.sqlserver.id
}

output "asql_database_id" {
  value = values(azurerm_mssql_database.db)[*].id
}

output "asql_database_details" {
  value = azurerm_mssql_database.db
}

output "asql_server_fqdn" {
  value = azurerm_mssql_server.sqlserver.fully_qualified_domain_name
}
