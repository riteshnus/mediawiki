resource "azurerm_network_interface" "nic" {
  for_each            = var.vm_nic_config
  resource_group_name = var.rg_resource_group_name
  location            = var.rg_location
  name                = "nic-${each.value.name}"
  tags                = merge({ "ResourceName" = format("%s", each.value.name) }, var.tags, )

  ip_configuration {
    name                          = each.value.name
    primary                       = true
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = each.value.private_ip != null ? "Static" : "Dynamic"
    private_ip_address            = each.value.private_ip != null ? each.value.private_ip : null
  }

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
