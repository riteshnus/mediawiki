## resource group
resource "azurerm_resource_group" "rg" {
  
  name     = format("%s", var.rg_resource_group_name)
  location = var.rg_location

  lifecycle {
    prevent_destroy = false
  }

  tags     = merge({ "Resource Name" = format("%s", var.rg_resource_group_name) }, var.tags, )
}
