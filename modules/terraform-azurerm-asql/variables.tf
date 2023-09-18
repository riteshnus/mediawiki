## resource group
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

variable "asql_sqlserver_name" {
  description = "The name of the Azure SQL."
  type        = string
  default     = null
}

variable "asql_admin_username" {
  description = "Administrator username"
  default     = null
}

variable "asql_admin_password" {
  description = "Administrator password"
  default     = null
}

variable "asql_sqlserver_config" {
  description = "Azure SQL server configuration."
  type = object({
    version                              = string
    connection_policy                    = string
    minimum_tls_version                  = string
    public_network_access_enabled        = bool
    outbound_network_restriction_enabled = bool
  })
  default = null
}

variable "asql_databases" {
  description = "For each SQL database, create an object that contain fields."
  type        = list(string)
  default     = []
}

variable "asql_database_config" {
  description = "Azure SQL server configuration."
  type = object({
    collation            = string
    max_size_gb          = number
    license_type         = string
    read_scale           = bool
    sku_name             = string
    storage_account_type = string
    zone_redundant       = bool
  })
  default = null
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
}
