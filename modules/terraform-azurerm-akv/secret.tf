locals {
  flattened_secrets_map = var.akv_secrets_map != null ? var.akv_secrets_map[keys(var.akv_secrets_map)[0]] : {}
}

resource "azurerm_key_vault_secret" "secret_map" {
  for_each        = local.flattened_secrets_map
  key_vault_id    = azurerm_key_vault.akv[keys(var.akv_secrets_map)[0]].id
  name            = format("%s", each.key)
  value           = lookup(lookup(local.flattened_secrets_map, each.key), "generate") == true ? random_password.password.result : lookup(lookup(local.flattened_secrets_map, each.key), "value")
  content_type    = lookup(lookup(local.flattened_secrets_map, each.key), "content_type")
  expiration_date = lookup(lookup(local.flattened_secrets_map, each.key), "expiration_date", var.default_secret_expiration_date)
  tags            = merge({ "ResourceName" = format("%s", each.key) }, var.tags)

  lifecycle {
    ignore_changes = [
      tags,
      expiration_date,
      key_vault_id,
      value,
      content_type,
    ]
  }
}
