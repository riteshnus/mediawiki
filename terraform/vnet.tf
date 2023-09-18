module "vnet" {
  source                  = "../modules/terraform-azurerm-vnet"
  providers               = { azurerm = azurerm.environment }
  rg_resource_group_name  = module.rg.rg_name
  rg_location             = module.rg.rg_location
  nw_virtual_network_name = var.nw_virtual_network_name
  nw_address_space        = var.nw_address_space
  tags                    = local.tags
}
