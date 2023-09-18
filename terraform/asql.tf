## azure sql
module "asql" {
  source = "../modules/terraform-azurerm-asql"
  depends_on = [
    module.akv
  ]
  providers              = { azurerm = azurerm.environment }
  rg_resource_group_name = module.rg.rg_name
  rg_location            = module.rg.rg_location
  asql_admin_username    = data.azurerm_key_vault_secret.admin_username
  asql_admin_password    = data.azurerm_key_vault_secret.admin_password
  asql_sqlserver_name    = var.asql_sqlserver_name
  asql_sqlserver_config  = var.asql_sqlserver_config
  asql_database_config   = var.asql_database_config
  asql_databases         = var.asql_databases

  tags = local.tags
}
