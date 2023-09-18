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

variable "nw_virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "nw_address_space" {
  description = "The address space to be used for the Azure virtual network."
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
