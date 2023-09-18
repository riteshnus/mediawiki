## Provider Config
env_sub_id = "b0c690db-42a4-4f1a-b269-9c5ec9ea6ad1"

## Naming Convention
project_name   = ["mediawiki"]
environment    = ["dev"]
region_mapping = ["ae"]

## Resource Group
rg_resource_group_name = "mediawiki-rg-dev-ae"
rg_location            = "australiaeast"

## Vnet
nw_virtual_network_name = "mediawiki-vnet-dev-ae"
nw_address_space        = ["172.21.0.0/16"]

## Subnets
sql_subnet_name = "mediawiki-snet-dev-ae-sql"
vm_subnet_name  = "mediawiki-snet-dev-ae-vm"

nw_subnets = {
  "mediawiki-snet-dev-ae-sql" = "172.21.0.0/24"
  "mediawiki-snet-dev-ae-vm"  = "172.21.1.0/24"
}

subnet_specific_service_endpoints = {
  mediawiki-snet-dev-ae-sql = ["Microsoft.KeyVault", "Microsoft.Sql"]
  mediawiki-snet-dev-ae-vm  = ["Microsoft.KeyVault", "Microsoft.Sql"]
}

subnet_specific_plink_endpoint_policy_enforcement = {
  "mediawiki-snet-dev-ae-sql" = "true"
  "mediawiki-snet-dev-ae-vm"  = "true"
}

subnet_specific_plink_service_policy_enforcement = {
  "mediawiki-snet-dev-ae-sql" = "true"
  "mediawiki-snet-dev-ae-vm"  = "true"
}

## Key Vault
akv_configuration = {
  "dev" = {
    name                            = "mediawiki-vault-dev-sea"
    sku_name                        = "premium"
    enabled_for_deployment          = true
    enabled_for_disk_encryption     = true
    enabled_for_template_deployment = true
    enable_rbac_authorization       = false
    purge_protection_enabled        = true
    enable_private_endpoint         = true
    soft_delete_retention_days      = 7
    public_network_access_enabled   = true
  }
}
akv_network_acls = {
  "dev" = {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    ip_rules                   = []
    virtual_network_subnet_ids = []
  },
}
akv_secrets = {
  "dev" = {
    sqlPassword = {
      value           = ""
      content_type    = ""
      generate        = true
      expiration_date = "2024-12-31T00:00:00Z"
    }
    sqlUser = {
      value           = "sqladmin"
      content_type    = ""
      generate        = false
      expiration_date = "2024-12-31T00:00:00Z"
    }
    vmPassword = {
      value           = ""
      content_type    = ""
      generate        = true
      expiration_date = "2024-12-31T00:00:00Z"
    }
    vmUser = {
      value           = "azureuser"
      content_type    = ""
      generate        = false
      expiration_date = "2024-12-31T00:00:00Z"
    }
  }
}

## Virtual Machine
virtual_machine_linux_config = {
  "linux-ae" = {
    name                 = "mklinux"
    size                 = "Standard_B2s"
    image                = "ubuntu2004-gen2"
    storage_account_type = "Standard_LRS"
    private_ip           = "172.21.1.5"
    publisher            = "Canonical"
    offer                = "UbuntuServer"
    sku                  = "18.04-LTS"
  }
}


## MS SQL
asql_sqlserver_name = "mediawiki-asql-dev-ae"
asql_sqlserver_config = {
  version                              = "12.0"
  connection_policy                    = "Default"
  minimum_tls_version                  = "1.2"
  public_network_access_enabled        = false
  outbound_network_restriction_enabled = true
}
asql_database_config = {
  collation            = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb          = 5
  license_type         = "LicenseIncluded"
  read_scale           = true
  sku_name             = "S0"
  storage_account_type = "Local"
  zone_redundant       = true
}
asql_databases = ["account"]
