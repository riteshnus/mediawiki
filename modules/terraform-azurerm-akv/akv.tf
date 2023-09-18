## key vault
resource "azurerm_key_vault" "akv" {
  # count = var.akv_key_vault_create ? 1 : 0
  for_each            = var.akv_config
  location            = var.rg_location
  resource_group_name = var.rg_resource_group_name

  name                            = format("%s", each.value.name)
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  sku_name                        = each.value.sku_name
  enabled_for_deployment          = each.value.enabled_for_deployment
  enabled_for_disk_encryption     = each.value.enabled_for_disk_encryption
  enabled_for_template_deployment = each.value.enabled_for_template_deployment
  soft_delete_retention_days      = each.value.soft_delete_retention_days
  enable_rbac_authorization       = each.value.enable_rbac_authorization
  purge_protection_enabled        = each.value.purge_protection_enabled
  public_network_access_enabled   = each.value.public_network_access_enabled
  tags                            = merge({ "ResourceName" = format("%s", each.value.name) }, var.tags, )


  dynamic "network_acls" {
    for_each = lookup(var.network_acls, each.key, null) != null ? [true] : []
    content {
      bypass                     = lookup(var.network_acls, each.key).bypass
      default_action             = lookup(var.network_acls, each.key).default_action
      ip_rules                   = lookup(var.network_acls, each.key).ip_rules
      virtual_network_subnet_ids = lookup(var.network_acls, each.key).virtual_network_subnet_ids
    }
  }

  lifecycle {
    ignore_changes = [
      tags,
      tenant_id,
      network_acls[0].ip_rules
    ]
  }
}
