## subnets
resource "azurerm_subnet" "snet" {
  for_each                                      = var.nw_subnets
  name                                          = each.key
  resource_group_name                           = var.rg_resource_group_name
  virtual_network_name                          = var.nw_virtual_network_name
  address_prefixes                              = [each.value]
  service_endpoints                             = lookup(var.subnet_specific_service_endpoints, each.key)
  private_endpoint_network_policies_enabled     = lookup(var.subnet_specific_plink_endpoint_policy_enforcement, each.key)
  private_link_service_network_policies_enabled = lookup(var.subnet_specific_plink_service_policy_enforcement, each.key)
}


