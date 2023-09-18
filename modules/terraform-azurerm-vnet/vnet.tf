## virtual network
resource "azurerm_virtual_network" "vnet" {

  name                = format("%s", var.nw_virtual_network_name)
  resource_group_name = var.rg_resource_group_name
  location            = var.rg_location
  address_space       = var.nw_address_space
  tags                = merge({ "Resource Name" = format("%s", var.nw_virtual_network_name) }, var.tags, )

  lifecycle {
    prevent_destroy = false
  }
}
