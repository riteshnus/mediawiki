resource "random_password" "password" {
  depends_on = [
    azurerm_key_vault.akv,
  ]

  length      = 20
  min_upper   = 2
  min_lower   = 2
  min_numeric = 2
  min_special = 2
}
