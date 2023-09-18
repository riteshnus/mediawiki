provider "azurerm" {
  alias           = "environment"
  subscription_id = var.env_sub_id
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
