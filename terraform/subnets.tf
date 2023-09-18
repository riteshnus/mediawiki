module "subnets" {
  source                  = "../modules/terraform-azurerm-subnets"
  providers               = { azurerm = azurerm.environment }
  rg_resource_group_name  = module.rg.rg_name
  nw_virtual_network_name = module.vnet.vnet_name

  nw_subnets                                        = var.nw_subnets
  subnet_specific_service_endpoints                 = var.subnet_specific_service_endpoints
  subnet_specific_plink_endpoint_policy_enforcement = var.subnet_specific_plink_endpoint_policy_enforcement
  subnet_specific_plink_service_policy_enforcement  = var.subnet_specific_plink_service_policy_enforcement
}
