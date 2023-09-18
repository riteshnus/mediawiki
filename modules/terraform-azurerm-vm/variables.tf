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

## NIC
variable "vm_nic_config" {
  description = "Network Interface configuration."
  default     = null
}

## virtual machine
variable "vm_linux_config" {
  description = "Virtual Machine Linux configuration."
  default     = null
}

## tags
variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
