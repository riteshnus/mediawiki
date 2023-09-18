module "akv" {
  source                 = "../modules/terraform-azurerm-akv"
  providers              = { azurerm = azurerm.environment }
  rg_resource_group_name = module.rg.rg_name
  rg_location            = module.rg.rg_location
  akv_config             = var.akv_configuration
  access_policies        = local.akv_access_policies
  akv_secrets_map        = var.akv_secrets
  network_acls = merge(var.akv_network_acls,
    {
      (var.environment[0]) = merge(var.akv_network_acls[var.environment[0]],
        {
          virtual_network_subnet_ids = [
            lookup(module.subnets.vnet_subnets_id_mappings, var.vm_subnet_name),
          ]
        }
      )
    }
  )
  tags = local.tags
}
