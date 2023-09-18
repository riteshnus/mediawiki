locals {
  common_param = {
    disable_password_authentication     = false
    encryption_at_host_enabled          = false
    os_disk_caching                     = "ReadWrite"
    os_disk_encryption_set_id           = null
    os_disk_size_gb                     = 128
    os_enable_os_disk_write_accelerator = false
    ultra_ssd_enabled                   = false
    enable_boot_diagnostics             = true
    vm_custom_image                     = null
  }

  vm_linux_config = merge(var.virtual_machine_linux_config,
    {
      format("%s-%s", "linux", var.region_mapping[0]) = merge(local.common_param, lookup(var.virtual_machine_linux_config, format("%s-%s", "linux", var.region_mapping[0])),
        {
          subnet_id      = lookup(module.subnets.vnet_subnets_id_mappings, var.vm_subnet_name)
          admin_username = data.azurerm_key_vault_secret.vm_admin_username
          admin_password = data.azurerm_key_vault_secret.vm_admin_password
        }
      )
  })
}

module "vm" {
  source                 = "../modules/terraform-azurerm-vm"
  providers              = { azurerm = azurerm.environment }
  vm_linux_config        = local.vm_linux_config
  vm_nic_config          = local.vm_linux_config
  rg_resource_group_name = module.rg.rg_name
  rg_location            = module.rg.rg_location
  tags                   = local.tags
}
