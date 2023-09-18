## Provider
variable "env_sub_id" { default = "" }

## Naming Convention
variable "project_name" { default = [] }
variable "environment" { default = [] }
variable "region_mapping" { default = [] }


## Resource Group
variable "rg_resource_group_name" { default = "" }
variable "rg_location" { default = "" }

## Vnet 
variable "nw_virtual_network_name" { default = "" }
variable "nw_address_space" { default = [] }

## Subnets
variable "nw_subnets" {
  description = "subnet asddresses"
  default     = {}
}
variable "subnet_specific_service_endpoints" {
  description = "subnet wise allowed endpoints"
  default     = {}
}
variable "subnet_specific_plink_endpoint_policy_enforcement" { default = {} }
variable "subnet_specific_plink_service_policy_enforcement" { default = {} }
variable "vm_subnet_name" { default = "" }

## Key Vault
variable "akv_configuration" { default = {} }
variable "akv_access_policies" { default = {} }
variable "akv_network_acls" { default = {} }
variable "akv_secrets" { default = {} }


## MSSQL
variable "asql_sqlserver_name" { default = "" }
variable "asql_sqlserver_config" { default = {} }
variable "asql_database_config" { default = {} }
variable "asql_databases" { default = {} }

# Virtual Machine
variable "virtual_machine_linux_config" { default = {} }
