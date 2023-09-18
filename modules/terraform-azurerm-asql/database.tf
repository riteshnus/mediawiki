resource "azurerm_mssql_database" "db" {
  for_each = toset(var.asql_databases)

  name                 = format("%s", each.key)
  server_id            = azurerm_mssql_server.sqlserver.id
  collation            = var.asql_database_config.collation
  license_type         = var.asql_database_config.license_type
  max_size_gb          = var.asql_database_config.max_size_gb
  read_scale           = var.asql_database_config.read_scale
  sku_name             = var.asql_database_config.sku_name
  storage_account_type = var.asql_database_config.storage_account_type
  zone_redundant       = var.asql_database_config.zone_redundant
  tags                 = merge({ "ResourceName" = format("%s", each.key) }, var.tags, )

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}



