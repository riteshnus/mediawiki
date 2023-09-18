## azure sql
resource "azurerm_mssql_server" "sqlserver" {
  name                                 = format("%s", var.asql_sqlserver_name)
  resource_group_name                  = var.rg_resource_group_name
  location                             = var.rg_location
  version                              = var.asql_sqlserver_config.version
  administrator_login                  = var.asql_admin_username.value
  administrator_login_password         = var.asql_admin_password.value
  connection_policy                    = var.asql_sqlserver_config.connection_policy
  minimum_tls_version                  = var.asql_sqlserver_config.minimum_tls_version
  public_network_access_enabled        = var.asql_sqlserver_config.public_network_access_enabled
  outbound_network_restriction_enabled = var.asql_sqlserver_config.outbound_network_restriction_enabled
  tags                                 = merge({ "ResourceName" = format("%s", var.asql_sqlserver_name) }, var.tags, )
}
