module "rg" {
  source                 = "../modules/terraform-azurerm-rg"
  providers              = { azurerm = azurerm.environment }
  rg_resource_group_name = var.rg_resource_group_name
  rg_location            = var.rg_location

  tags = local.tags
}
