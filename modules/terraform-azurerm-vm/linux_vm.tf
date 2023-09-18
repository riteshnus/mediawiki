## linux virtual machine
resource "azurerm_linux_virtual_machine" "linux_vm" {
  depends_on = [
    azurerm_network_interface.nic,
  ]
  for_each                        = var.vm_linux_config
  resource_group_name             = var.rg_resource_group_name
  location                        = var.rg_location
  name                            = each.value.name
  size                            = each.value.size
  admin_username                  = each.value.admin_username.value
  admin_password                  = each.value.admin_password.value
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids           = [azurerm_network_interface.nic[each.key].id, ]
  encryption_at_host_enabled      = lookup(each.value, "encryption_at_host_enabled", false)
  zone                            = lookup(each.value, "zone", null)
  tags                            = merge({ "ResourceName" = format("%s", each.value.name) }, var.tags, )

  os_disk {
    storage_account_type = lookup(each.value, "storage_account_type", null)
    caching              = lookup(each.value, "os_disk_caching", "ReadWrite")
    name                 = "dsk-${each.value.name}"
  }

  source_image_reference {
    publisher = lookup(each.value, "publisher")
    offer     = lookup(each.value, "offer")
    sku       = lookup(each.value, "sku")
    version   = "latest"
  }

  dynamic "identity" {
    for_each = lookup(each.value, "vm_managed_identity_type", null) != null ? [1] : []
    content {
      type         = each.value.vm_managed_identity_type
      identity_ids = var.vm_managed_identity_type == "UserAssigned" || var.vm_managed_identity_type == "SystemAssigned, UserAssigned" ? each.value.vm_managed_identity_ids : null
    }
  }

  lifecycle {
    ignore_changes = [
      admin_username,
      admin_password,
      identity,
      tags,
    ]
  }
}
