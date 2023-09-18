variable "rg_resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
  default     = null
}
variable "rg_location" {
  description = "Specifies the supported Azure location where the resource should be created."
  type        = string
  default     = null
}
variable "akv_config" {
  description = "Azure keyVault config"
  type = map(object({
    name                            = string
    sku_name                        = string
    enabled_for_deployment          = bool
    enabled_for_disk_encryption     = bool
    enabled_for_template_deployment = bool
    enable_rbac_authorization       = bool
    purge_protection_enabled        = bool
    soft_delete_retention_days      = number
    public_network_access_enabled   = bool
  }))
  default = null
}
variable "access_policies" {
  description = "List of access policies for the Key Vault."
  default     = []
}
variable "network_acls" {
  description = "Network rules to apply to key vault."
  type = map(object({
    bypass                     = string
    default_action             = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  }))
  default = null
}

variable "default_secret_expiration_date" {
  description = "Specifies the default expiration date for the secret."
  type        = string
  default     = null
}

variable "akv_secrets_map" {
  description = "Define Azure Key Vault secrets as map and use it as map"
  type        = map(any)
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
