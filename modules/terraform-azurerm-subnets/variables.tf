

variable "rg_resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
  default     = null
}

variable "nw_virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "nw_subnets" {
  description = "For each subnet, create an object that contain fields."
  type        = map(any)
  default     = {}
}

variable "subnet_specific_service_endpoints" {
  description = "list of enabled private endpoints to each subnet"
  type        = map(any)
  default     = {}

}

variable "subnet_specific_plink_endpoint_policy_enforcement" {
  description = "bool value for endpoint policy enfoircement"
  type        = map(any)
  default     = {}
}

variable "subnet_specific_plink_service_policy_enforcement" {
  description = "bool value for service policy enfoircement"
  type        = map(any)
  default     = {}
}
